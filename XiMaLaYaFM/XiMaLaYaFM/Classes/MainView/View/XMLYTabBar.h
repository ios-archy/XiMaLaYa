//
//  XMLYTabBar.h
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLYTabBar : UITabBar


///点击中间按钮执行block回调

@property (nonatomic,copy) void (^MiddleClickBlock)(BOOL isPlaying);


@end
