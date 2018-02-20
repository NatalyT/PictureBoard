//
//  DoublePictureTableViewCell.h
//  PictureBoard
//
//  Created by Nataly Tatarintseva on 2/20/18.
//  Copyright © 2018 Nataly Tatarintseva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoublePictureTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *doubleImageViewLeft;
@property (weak, nonatomic) IBOutlet UIImageView *doubleImageViewRight;

@end
