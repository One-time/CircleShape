//
//  CircleShapeView.m
//  CAShapeLayer
//
//  Created by Jack on 16/2/24.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "CircleShapeView.h"

@interface CircleShapeView ()
@property (strong, nonatomic) NSArray *colors;

@end

@implementation CircleShapeView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawCircleShape{
    [self drawCircleShapePercentages:@[@"0.25", @"0.25", @"0.4", @"0.1"]];
}

- (void)drawCircleShapePercentages:(NSArray *)Percentages{
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = 0;
    CGFloat angle1 = 0;
    for (int i = 0; i < Percentages.count; i++) {
        NSString  *angle = Percentages[i];
        angle1 += angle.doubleValue;
        endAngle = angle1 * M_PI *2 - M_PI_2;
       CAShapeLayer *layer = [self drawCircleShapeStartAngle:startAngle endAngle:endAngle color:self.colors[i]];
        [self.layer addSublayer:layer];
        startAngle = endAngle;
    }
    
}


- (CAShapeLayer *)drawCircleShapeStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle color:(UIColor *)color{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = color.CGColor;
    layer.path = [self shapeWithstartAngle:startAngle endAngle:endAngle];
    //[self.layer addSublayer:layer];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0, 0, 40, 40);
    //[textLayer setAnchorPoint:CGPointZero];
    [textLayer setString:@"12"];
    [textLayer setAlignmentMode:kCAAlignmentCenter];
    [textLayer setPosition:CGPointMake(100 + 50 *cos((endAngle + startAngle)/2), 100 + 50 * sin((startAngle + endAngle)/2))];
    textLayer.borderColor = [UIColor blackColor].CGColor;
    textLayer.borderWidth = 2.0f;
    [layer addSublayer:textLayer];
    return layer;
}


- (CGPathRef)shapeWithstartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)/2)];
    [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)/2) radius:CGRectGetWidth(self.frame)>=CGRectGetHeight(self.frame)?CGRectGetHeight(self.frame)/2-4:CGRectGetWidth(self.frame)/2-4 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    return path.CGPath;
}

- (NSArray *)colors{
    if (!_colors) {
        _colors = @[[UIColor redColor], [UIColor grayColor], [UIColor greenColor], [UIColor orangeColor]];
    }
    return _colors;
}

#pragma mark -- Touch Handing

//根据触摸点判断返回当前显示的扇形
- (NSInteger)getCurrentSelectedOnTouch:(CGPoint)point
{
    __block NSUInteger selectedIndex = -1;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    CALayer *parentLayer = [self layer];
    NSArray *pieLayers = [parentLayer sublayers];
    
    [pieLayers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CAShapeLayer *pieLayer = (CAShapeLayer *)obj;
        CGPathRef path = [pieLayer path];
        
        if (CGPathContainsPoint(path, &transform, point, 0)) {
            selectedIndex = idx;
        }     }];
    return selectedIndex;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    //NSLog(@"point%f- %f",point.x, point.y);
    NSLog(@"点击了%ld",[self getCurrentSelectedOnTouch:point]);
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"canceld");
    
}

@end
