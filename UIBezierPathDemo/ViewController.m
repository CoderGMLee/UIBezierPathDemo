//
//  ViewController.m
//  UIBezierPathDemo
//
//  Created by 李国民 on 15/8/10.
//  Copyright (c) 2015年 李国民. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CustomView * view = [[CustomView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
//    [self test1];
}
- (void)test1{
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path stroke];
//    [[UIColor blackColor] setStroke];
    
    CAShapeLayer * pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = nil;
    pathLayer.fillColor = [UIColor greenColor].CGColor;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    
    
    self.view.layer.mask = pathLayer;
    
    

}





@end
