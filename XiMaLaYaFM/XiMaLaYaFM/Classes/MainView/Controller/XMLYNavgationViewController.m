//
//  XMLYNavgationViewController.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "XMLYNavgationViewController.h"
#import "XMLYNavBar.h"
#import "XMLYMiddleView.h"

@interface XMLYNavgationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XMLYNavgationViewController


-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self =[super initWithRootViewController:rootViewController]) {
        [self setValue:[[XMLYNavBar alloc] init] forKey:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    
    
    UIPanGestureRecognizer *panGester =[[UIPanGestureRecognizer alloc]initWithTarget:gester.delegate     action:NSSelectorFromString(@"handleNavigationTransition:")];
    
    [gester.view addGestureRecognizer:panGester];
    gester.delaysTouchesBegan = YES;
    panGester.delegate = self;
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated

{
    
    //拦截没一个Push的控制器。进行统一设置
    //过滤第一个根控制器
    if (self.childViewControllers.count > 0) {
        
        viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_back_n"] style:0 target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    if (viewController.view.tag == 666) {
        viewController.view.tag = 888;
        XMLYMiddleView *middelView = [XMLYMiddleView middleView];
        middelView.middleClickBlock = [XMLYMiddleView shareInstance].middleClickBlock;
        middelView.isPlaying =[XMLYMiddleView shareInstance].isPlaying;
        middelView.MiddleImg = [XMLYMiddleView shareInstance].MiddleImg;
        
        CGRect frame = middelView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middelView.frame = frame;
        [viewController.view addSubview:middelView];
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (self.childViewControllers.count <= 1) {
        return NO;
    }
    return YES;
    
}

@end
