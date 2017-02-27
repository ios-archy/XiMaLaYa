//
//  UIView+XMLYLayout.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "UIView+XMLYLayout.h"

@implementation UIView (XMLYLayout)


-(void)setX:(CGFloat)x
{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}
-(void)setY:(CGFloat)y
{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}
-(void)setWidth:(CGFloat)width
{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
}
-(void)setHeight:(CGFloat)height
{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
}
-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center= self.center;
    center.x = centerX;
    self.center = center;
    
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)x
{
    
    return self.frame.origin.x ;
}
-(CGFloat)y
{
    
    return  self.frame.origin.y;
}

-(CGFloat)width
{
    
    return  self.frame.size.width;
}

-(CGFloat) height
{
    
    return  self.frame.size.height ;
}

-(CGFloat)centerX
{
    
    return  self.center.x;
}

-(CGFloat)centerY
{
    
    return  self.center.y;
}



@end
