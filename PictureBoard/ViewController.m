//
//  ViewController.m
//  PictureBoard
//
//  Created by Nataly Tatarintseva on 2/17/18.
//  Copyright © 2018 Nataly Tatarintseva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *urlArray = [self splitFileToArray];
    [self loadImageFromURL: urlArray[0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) loadImageFromURL :(NSString *)imageUrl{
    NSURL *urlForImage = [NSURL URLWithString: imageUrl];
    NSData *dataImage = [NSData dataWithContentsOfURL: urlForImage];
    UIImage *imageData = [UIImage imageWithData: dataImage];
    _imageView.image = imageData;
}

-(NSArray*) splitFileToArray {
    NSURL *url = [[NSBundle mainBundle] URLForResource: @"url20" withExtension: @"txt"];
    NSString *fileViaURL = [[NSString alloc] initWithContentsOfURL: url encoding: NSUTF8StringEncoding error: nil];
    NSArray *urlArray = [fileViaURL componentsSeparatedByString: @"\n"];
    return urlArray;
}

@end
