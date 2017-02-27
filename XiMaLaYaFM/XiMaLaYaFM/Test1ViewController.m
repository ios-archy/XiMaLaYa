//
//  Test1ViewController.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/27.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "Test1ViewController.h"
#import "Test2ViewController.h"
@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor grayColor];
    self.view.tag = 666;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"playState" object:@(isPlay)];
    UIImage *image =[UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"playImage" object:image];
    [self.navigationController pushViewController:[Test2ViewController new] animated:YES];
}



@end
