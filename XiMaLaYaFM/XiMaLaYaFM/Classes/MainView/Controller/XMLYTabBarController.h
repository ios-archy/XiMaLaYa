//
//  XMLYTabBarController.h
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLYTabBarController : UITabBarController



+(instancetype)shareInstance;


+(instancetype)tabBarControllerWithAddChildVCsBlock:(void(^)(XMLYTabBarController *tabBarVC))addVCBlock;


-(void)addChildVC:(UIViewController *)VC normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selecteImageName isRequiredNavController:(BOOL)isRequired;
@end
