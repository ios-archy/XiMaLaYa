//
//  XMLYNavBar.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "XMLYNavBar.h"

@implementation XMLYNavBar

///设置全局的导航栏的背景图片
+(void)setGlobalBackImage:(UIImage *)globalImg

{
    
    UINavigationBar *navBar =[UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"XMLYNavgationViewController")  , nil];
//    UIBarMetricsDefault,
//    UIBarMetricsCompact,
//    UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
//    UIBarMetricsCompactPrompt,
//    
//    UIBarMetricsLandscapePhone NS_ENUM_DEPRECATED_IOS(5_0, 8_0, "Use UIBarMetricsCompact instead") = UIBarMetricsCompact,
//    UIBarMetricsLandscapePhonePrompt NS_ENUM_DEPRECATED_IOS(7_0, 8_0, "Use UIBarMetricsCompactPrompt") = UIBarMetricsCompactPrompt,
    [navBar setBackgroundImage:globalImg forBarMetrics:UIBarMetricsDefault];
    
}
///设置全局导航栏标题颜色
 +(void)setGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontsize
{
    if (globalTextColor==nil) {
        return;
    }
    if (fontsize < 6 || fontsize >40) {
        fontsize = 16;
    }
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"XMLYNavgationViewController"), nil];
    NSDictionary *TitleDic = @{
                               NSForegroundColorAttributeName : globalTextColor,
                               NSFontAttributeName  : [UIFont systemFontOfSize: fontsize]
                               };
    
    [navBar setTitleTextAttributes:TitleDic];
}

@end
