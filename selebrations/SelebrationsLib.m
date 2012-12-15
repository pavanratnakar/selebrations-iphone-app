//
//  SelebrationsLib.m
//  Selebrations
//
//  Created by Pavan Ratnakar on 12/15/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "SelebrationsLib.h"

@implementation SelebrationsLib

+ (UIColor *) getRandomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.5];
}

@end