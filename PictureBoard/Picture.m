//
//  Picture.m
//  PictureBoard
//
//  Created by Nataly Tatarintseva on 2/19/18.
//  Copyright © 2018 Nataly Tatarintseva. All rights reserved.
//

#import "Picture.h"

@implementation Picture

- (NSMutableArray*)fetchAll {
    NSError *error;
    NSString *urlString = [NSString stringWithFormat: @"http://img.selocon.com/media/misc/urls.json"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:urlString]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSMutableArray* urlArray = [[NSMutableArray alloc]init];
    for(NSDictionary* dict in json)
    {
        [urlArray addObject:[dict valueForKey:@"url"]];
    }
    return urlArray;
}

@end
