//
//  ViewController.m
//  PictureBoard
//
//  Created by Nataly Tatarintseva on 2/17/18.
//  Copyright © 2018 Nataly Tatarintseva. All rights reserved.
//

#import "PictureTableViewController.h"
#import "SinglePictureTableViewCell.h"
#import "DoublePictureTableViewCell.h"
#import "TripplePictureTableViewCell.h"

@interface PictureTableViewController ()

@end

@implementation PictureTableViewController

NSArray *urlArray;
Picture *pictureObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    pictureObject = [[Picture alloc]init];
    urlArray = [pictureObject fetchAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [urlArray count] / 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.row % 3 == 0) {
        cell = [self renderSinglePicture:tableView :indexPath];
    } else if (indexPath.row % 3 == 1) {
        cell = [self renderDoublePicture:tableView :indexPath];
    } else {
        cell = [self renderTripplePicture:tableView :indexPath];
    }
    return cell;
}

- (void)loadImageFromURL:(NSString *)imageUrl :(UIImageView *)imageView {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSURL *urlForImage = [NSURL URLWithString: imageUrl];
                       NSData *dataImage = [NSData dataWithContentsOfURL: urlForImage];
                       
                       dispatch_sync(dispatch_get_main_queue(), ^{
                           UIImage *imageData = [UIImage imageWithData: dataImage];
                           imageView.image = imageData;
                       });
                   });
}

- (NSUInteger) calculatePictureNumber:(NSInteger) row {
    row++;
    NSInteger div = row / 3;
    NSInteger mod = row % 3;
    return 6 * div + mod - 1;
}

- (SinglePictureTableViewCell *) renderSinglePicture: (UITableView *)tableView :(NSIndexPath *)indexPath {
    static NSString *singlePictureTableIdentifier = @"SinglePictureTableCell";
    SinglePictureTableViewCell *cell = (SinglePictureTableViewCell *)[tableView dequeueReusableCellWithIdentifier:singlePictureTableIdentifier forIndexPath:indexPath];
    cell.singleImageView.image = [UIImage imageNamed:@"Placeholder.png"];
    
    NSInteger pictureNumber = [self calculatePictureNumber:indexPath.row];
    NSString *imageUrl = [urlArray objectAtIndex:pictureNumber];
    [self loadImageFromURL: imageUrl :cell.singleImageView];
    
    if (cell == nil) {
        cell = [[SinglePictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:singlePictureTableIdentifier];
    }
    return cell;
}

- (DoublePictureTableViewCell *) renderDoublePicture: (UITableView *)tableView :(NSIndexPath *)indexPath {
    static NSString *doublePictureTableIdentifier = @"DoublePictureTableCell";
    DoublePictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:doublePictureTableIdentifier forIndexPath:indexPath];
    NSInteger pictureNumber = [self calculatePictureNumber:indexPath.row];
    cell.doubleImageViewLeft.image = [UIImage imageNamed:@"Placeholder.png"];
    cell.doubleImageViewRight.image = [UIImage imageNamed:@"Placeholder.png"];
    
    NSString *leftImageUrl = [urlArray objectAtIndex:pictureNumber];
    [self loadImageFromURL: leftImageUrl :cell.doubleImageViewLeft];
    NSString *rightImageUrl = [urlArray objectAtIndex:pictureNumber + 1];
    [self loadImageFromURL: rightImageUrl :cell.doubleImageViewRight];
    
    if (cell == nil) {
        cell = [[DoublePictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:doublePictureTableIdentifier];
    }
    return cell;
}

- (TripplePictureTableViewCell *) renderTripplePicture: (UITableView *)tableView :(NSIndexPath *)indexPath {
    static NSString *tripplePictureTableIdentifier = @"TripplePictureTableCell";
    TripplePictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tripplePictureTableIdentifier forIndexPath:indexPath];
    NSInteger pictureNumber = [self calculatePictureNumber:indexPath.row];
    cell.trippleImageViewLeft.image = [UIImage imageNamed:@"Placeholder.png"];
    cell.trippleImageViewCenter.image = [UIImage imageNamed:@"Placeholder.png"];
    cell.trippleImageViewRight.image = [UIImage imageNamed:@"Placeholder.png"];
    
    
    NSString *leftImageUrl = [urlArray objectAtIndex:pictureNumber - 2];
    [self loadImageFromURL: leftImageUrl :cell.trippleImageViewLeft];
    NSString *centerImageUrl = [urlArray objectAtIndex:pictureNumber - 1];
    [self loadImageFromURL: centerImageUrl :cell.trippleImageViewCenter];
    NSString *rightImageUrl = [urlArray objectAtIndex:pictureNumber];
    [self loadImageFromURL: rightImageUrl :cell.trippleImageViewRight];
    
    if (cell == nil) {
        cell = [[TripplePictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tripplePictureTableIdentifier];
    }
    return cell;
}

@end
