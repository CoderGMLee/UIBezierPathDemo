//
//  CustomView.m
//  UIBezierPathDemo
//
//  Created by 李国民 on 15/8/10.
//  Copyright (c) 2015年 李国民. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
{
    CAShapeLayer * shapeLayer;
}

/*
 理解：UIBezierPath是针对Core Graphics做了一些简单的封装（将底层C的API使其OC化），使其能够不在drawRect中也能绘制图形，贝塞尔曲线有一个复杂的计算公式，可以根据公式绘制出不同的图形
 
 学习链接：http://blog.csdn.net/guo_hongjun1611/article/details/7842110
 
 使用CAShapeLayer与UIBezierPath可以实现不在view的drawRect方法中就画出一些想要的图形
 
 步骤：
 1、新建UIBezierPath对象bezierPath
 2、新建CAShapeLayer对象caShapeLayer
 3、将bezierPath的CGPath赋值给caShapeLayer的path，即caShapeLayer.path = bezierPath.CGPath
 4、把caShapeLayer添加到某个显示该图形的layer中
 */
- (void)drawRect:(CGRect)rect {
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.backgroundColor = [UIColor whiteColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.lineCap = kCAFillRuleNonZero;
    shapeLayer.frame = self.bounds;
    [self.layer addSublayer:shapeLayer];
    
//    [self setStroke];
//    [self setCircle];
    [self setLine];
}
- (id)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
//        shapeLayer = [CAShapeLayer layer];
//        shapeLayer.backgroundColor = [UIColor whiteColor].CGColor;
//        shapeLayer.fillColor = [UIColor redColor].CGColor;
//        shapeLayer.lineCap = kCAFillRuleNonZero;
//        shapeLayer.frame = self.bounds;
//        [self.layer addSublayer:shapeLayer];
//        [self setCircle];
    }
    return self;
}
//绘制圆形
- (void)setStroke{
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:4];
    shapeLayer.path = path.CGPath;
}
//绘制带有圆角的矩形
- (void)setCircle{
    /*
     center : 中心点
     radius : 半径
     startAngle : 起始角度
     endAngle : 终止角度
     clockwise : 是否顺时针
     */
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:self.center radius:50 startAngle:M_PI endAngle:M_PI * 2 clockwise:YES];
    shapeLayer.path = path.CGPath;
    
}
//绘制线段
- (void)setLine{
    
    UIBezierPath * path =[UIBezierPath new];
    [path moveToPoint:CGPointMake(35, 200)];
    [path addLineToPoint:CGPointMake(50, 150)];
    [path addLineToPoint:CGPointMake(240, 150)];
//    [path addLineToPoint:CGPointMake(250, 150)];
    [path addCurveToPoint:CGPointMake(240, 150) controlPoint1:CGPointMake(50, 150) controlPoint2:CGPointMake(35, 200)];
    [path stroke];
    [[UIColor redColor] setStroke];
    
    shapeLayer.path = path.CGPath;
    
    
}





@end
