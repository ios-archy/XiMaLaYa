//
//  XMLYTabBar.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "XMLYTabBar.h"

#import "XMLYMiddleView.h"
#import "XMLYNavgationViewController.h"
#import "UIView+XMLYLayout.h"


#define KScreenWidth [UIScreen mainScreen].bounds.size.width

#define KScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface XMLYTabBar ()

@property (nonatomic,weak)XMLYMiddleView *middleView;

@end


@implementation XMLYTabBar


///加载控件
-(XMLYMiddleView *)middleView
{
    
    if (!_middleView) {
        _middleView =[XMLYMiddleView shareInstance];
        [self addSubview:_middleView];
    }
    return _middleView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        
        [self setUpInit];
    }
    return self;
}

-(void)setUpInit
{
    self.barStyle = UIBarStyleBlack;

    self.backgroundImage =[UIImage imageNamed:@"tabbar_bg"];
    
    CGFloat width = 65;
    CGFloat height = 65;

   
    self.middleView.frame =CGRectMake((KScreenWidth-width)* 0.5, (KScreenHeight - height), width, height);
    
}

-(void)setMiddleClickBlock:(void (^)(BOOL))MiddleClickBlock
{
    self.middleView.middleClickBlock =MiddleClickBlock;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    NSInteger count = self.items.count;
    
    NSArray *subviews = self.subviews;
    
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    CGFloat btnY = 5;
    
    NSInteger index = 0;
    for (UIView *Subview in subviews) {
        
        if ([Subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == count / 2) {
                index ++;
            }
            
            CGFloat btnX = index * btnW;
            Subview.frame = CGRectMake(btnX, btnY, btnW, btnH);
            index++;
        }
    }
    self.middleView.centerX = self.frame.size.width * 0.5;
    self.middleView.y = self.height  - self.middleView.height;
}
@end
