//
//  ViewController.m
//  PictureBoard
//
//  Created by Nataly Tatarintseva on 2/17/18.
//  Copyright © 2018 Nataly Tatarintseva. All rights reserved.
//

#import "PictureTableViewController.h"

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [urlArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *pictureTableIdentifier = @"PictureTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: pictureTableIdentifier];
    
    UIImageView *imageView;
    
    imageView = (UIImageView *)[cell viewWithTag:1];
    
    imageView.image = [self loadImageFromURL: [urlArray objectAtIndex:indexPath.row]];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: pictureTableIdentifier];
    }
    
    return cell;
}

- (UIImage *)loadImageFromURL:(NSString *)imageUrl {
    NSURL *urlForImage = [NSURL URLWithString: imageUrl];
    NSData *dataImage = [NSData dataWithContentsOfURL: urlForImage];
    UIImage *imageData = [UIImage imageWithData: dataImage];
    return imageData;
}

@end
