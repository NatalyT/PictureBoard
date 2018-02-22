//
//  TripplePictureTableViewCell.h
//  PictureBoard
//
//  Created by Nataly Tatarintseva on 2/20/18.
//  Copyright © 2018 Nataly Tatarintseva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripplePictureTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *trippleImageViewLeft;
@property (weak, nonatomic) IBOutlet UIImageView *trippleImageViewCenter;
@property (weak, nonatomic) IBOutlet UIImageView *trippleImageViewRight;

@end
