//
//  UIView+DrawLine.m
//  CircleShape
//
//  Created by Jack on 16/3/30.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "UIView+DrawLine.h"

@implementation UIView (DrawLine)

- (void)drawLines:(NSArray *)lines{
    for (NSArray *line in lines) {
        [self drawLine:line lineColor:[UIColor redColor] lineWidth:5.0];
    }
}

- (void)drawLine:(NSArray *)line lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth{
    
    CGPoint startPoint = CGPointFromString(line[0]);
    CGPoint endPoint = CGPointFromString(line[1]);
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    [lineLayer setLineWidth:lineWidth];
    [lineLayer setStrokeColor:lineColor.CGColor];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    [path closePath];
    
    [lineLayer setPath:path.CGPath];
    [self.layer addSublayer:lineLayer];
}
@end
