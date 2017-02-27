//
//  XMLYTabBarController.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "XMLYTabBarController.h"
#import "XMLYNavBar.h"
#import "XMLYTabBar.h"
#import "XMLYMiddleView.h"
#import "UIImage+XMLYImage.h"
#import "XMLYNavgationViewController.h"
@interface XMLYTabBarController ()

@end

@implementation XMLYTabBarController


+(instancetype)shareInstance
{
    static XMLYTabBarController *tabBarVC;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        code to be executed once
        tabBarVC = [[XMLYTabBarController alloc]init];
    });
    return tabBarVC;
}

+(instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(XMLYTabBarController *))addVCBlock
{
    XMLYTabBarController *tabbarVC =[[XMLYTabBarController alloc]init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    return tabbarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabbar];
}
-(void)setUpTabbar
{
    [self setValue:[[XMLYTabBar alloc] init] forKey:@"tabBar"];
}

-(void)addChildVC:(UIViewController *)VC normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selecteImageName isRequiredNavController:(BOOL)isRequired
{
    if (isRequired) {
        XMLYNavgationViewController *nav =[[XMLYNavgationViewController alloc]initWithRootViewController:VC];
        nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage originImageWithNames:normalImageName] selectedImage:[UIImage originImageWithNames:selecteImageName]];
        [self addChildViewController:nav];
    }
    else
    {
        [self addChildViewController:VC];
    }
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    UIViewController *vc =self.childViewControllers[selectedIndex];
    if (vc.view.tag == 666) {
        vc.view.tag = 888;
        XMLYMiddleView *middleView = [XMLYMiddleView middleView];
        middleView.middleClickBlock = [XMLYMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [XMLYMiddleView shareInstance].isPlaying;
        middleView.MiddleImg = [XMLYMiddleView shareInstance].MiddleImg;
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [vc.view addSubview:middleView];

    }
}

@end
