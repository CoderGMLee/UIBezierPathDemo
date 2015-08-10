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
}





@end
