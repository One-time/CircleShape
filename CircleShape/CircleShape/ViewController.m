//
//  ViewController.m
//  CircleShape
//
//  Created by Jack on 16/3/14.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CircleShapeView.h"
#import "UIView+DrawLine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CircleShapeView *view = [[CircleShapeView alloc]initWithFrame:CGRectMake(0, 44, 200, 200)];
//    view.layer.borderColor = [UIColor redColor].CGColor;
//    view.layer.borderWidth = 2.0f;
//    [view drawCircleShape];
//    [self.view addSubview:view];
    //测试画线
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 44, 200, 200)];
    [view drawLines:@[LineMake(0, 10, 100, 10),LineMake(0, 40, 100, 40)]];
    [self.view addSubview:view];
    
    NSLog(@"text git");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
