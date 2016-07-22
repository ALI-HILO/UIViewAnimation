//
//  UIView+ZRCategory.m
//  01PchDemo
//
//  Created by etcxm on 16/6/1.
//  Copyright © 2016年 中软国际. All rights reserved.
//

#import "UIView+ZRCategory.h"

@implementation UIView (ZRCategory)

//set方法
- (void)setX:(CGFloat)x;
{
    CGRect  tempFrame = self.frame;
    tempFrame.origin.x = x;
    self.frame = tempFrame;
}
//get方法
- (CGFloat)x;
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y;
{
    CGRect  tempFrame = self.frame;
    tempFrame.origin.y = y;
    self.frame = tempFrame;
}

- (CGFloat)y;
{
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width;
{
    CGRect  tempFrame = self.frame;
    tempFrame.size.width = width;
    self.frame = tempFrame;
}

- (CGFloat)width;
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height;
{
    CGRect  tempFrame = self.frame;
    tempFrame.size.height = height;
    self.frame = tempFrame;
}

- (CGFloat)height;
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size;
{
    CGRect  tempFrame = self.frame;
    tempFrame.size = size;
    self.frame = tempFrame;
}

- (CGSize)size;
{
    return self.frame.size;
}


- (void)setCenterX:(CGFloat)x;
{
    CGPoint tempPoint = self.center;
    tempPoint.x = x;
    self.center = tempPoint;
}

- (CGFloat)centerX;
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)y;
{
    CGPoint tempPoint = self.center;
    tempPoint.y = y;
    self.center = tempPoint;
}

- (CGFloat)centerY;
{
    return self.center.y;
}








@end
