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

- (UIImage *)loadImageFromURL:(NSString *)imageUrl {
    NSURL *urlForImage = [NSURL URLWithString: imageUrl];
    NSData *dataImage = [NSData dataWithContentsOfURL: urlForImage];
    UIImage *imageData = [UIImage imageWithData: dataImage];
    return imageData;
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
    NSInteger pictureNumber = [self calculatePictureNumber:indexPath.row];
    cell.singleImageView.image = [self loadImageFromURL: [urlArray objectAtIndex:pictureNumber]];
    if (cell == nil) {
        cell = [[SinglePictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:singlePictureTableIdentifier];
    }
    return cell;
}

- (DoublePictureTableViewCell *) renderDoublePicture: (UITableView *)tableView :(NSIndexPath *)indexPath {
    static NSString *doublePictureTableIdentifier = @"DoublePictureTableCell";
    DoublePictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:doublePictureTableIdentifier forIndexPath:indexPath];
    NSInteger pictureNumber = [self calculatePictureNumber:indexPath.row];
    cell.doubleImageViewLeft.image = [self loadImageFromURL: [urlArray objectAtIndex:pictureNumber]];
    cell.doubleImageViewRight.image = [self loadImageFromURL: [urlArray objectAtIndex:pictureNumber + 1]];
    if (cell == nil) {
        cell = [[DoublePictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:doublePictureTableIdentifier];
    }
    return cell;
}

- (TripplePictureTableViewCell *) renderTripplePicture: (UITableView *)tableView :(NSIndexPath *)indexPath {
    static NSString *tripplePictureTableIdentifier = @"TripplePictureTableCell";
    TripplePictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tripplePictureTableIdentifier forIndexPath:indexPath];
    NSInteger pictureNumber = [self calculatePictureNumber:indexPath.row];
    cell.trippleImageViewLeft.image = [self loadImageFromURL: [urlArray objectAtIndex:pictureNumber - 2]];
    cell.trippleImageViewCenter.image = [self loadImageFromURL: [urlArray objectAtIndex:pictureNumber - 1]];
    cell.trippleImageViewRight.image = [self loadImageFromURL: [urlArray objectAtIndex:pictureNumber]];
    if (cell == nil) {
        cell = [[TripplePictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tripplePictureTableIdentifier];
    }
    return cell;
}

@end
