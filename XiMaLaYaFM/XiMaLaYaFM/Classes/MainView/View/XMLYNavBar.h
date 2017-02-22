//
//  XMLYNavBar.h
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLYNavBar : UINavigationBar

///设置全局的导航背景图片
+(void)setGlobalBackImage:(UIImage *)globalImg;

///设置全局导航栏标题颜色，和文字大小
+(void)setGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat )fontsize;

@end
