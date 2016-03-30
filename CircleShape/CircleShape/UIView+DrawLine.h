//
//  UIView+DrawLine.h
//  CircleShape
//
//  Created by Jack on 16/3/30.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LineMake(start_X,start_Y,stop_X,stop_Y) @[NSStringFromCGPoint(CGPointMake(start_X, start_Y)),NSStringFromCGPoint(CGPointMake(stop_X,stop_Y))]

@interface UIView (DrawLine)

/*  draw one or more lines on view，
    example: [view drawLines:@[LineMake(0, 10, 100, 10)]];*/
- (void)drawLines:(NSArray *)lines;

@end
