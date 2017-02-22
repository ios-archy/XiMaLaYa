//
//  XMLYMiddleView.m
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import "XMLYMiddleView.h"
#import "CALayer+PauseAnimate.h"

@interface XMLYMiddleView ()

///中间的播放内容视图
@property (nonatomic,strong)UIImageView *MiddelImageView;

///播放按钮
@property (nonatomic,strong)UIButton *PlayBtn;

@end


@implementation XMLYMiddleView

static XMLYMiddleView *_shareInstance;


+(instancetype)shareInstance
{
    if (_shareInstance==nil) {
        _shareInstance = [XMLYMiddleView middleView];
    }
    return _shareInstance;
}

+(instancetype)middleView
{
    XMLYMiddleView *middleView =[[XMLYMiddleView alloc]initWithFrame:CGRectMake(0, 0, 65, 65)];
    return  middleView;
}


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addContent];
    }
    return self;
}

-(UIButton *)PlayBtn
{
    if (!_PlayBtn) {
        _PlayBtn =[[UIButton alloc]initWithFrame:self.frame];
    }
    return _PlayBtn;
}

-(UIImageView *)MiddelImageView
{
    if (!_MiddelImageView) {
        _MiddelImageView =[[UIImageView alloc]initWithFrame:self.frame];
        _MiddelImageView.layer.cornerRadius = self.frame.size.width / 2;
    }
    return _MiddelImageView;
}
-(void)addContent
{
    [self addSubview:self.MiddelImageView];
    [self addSubview:self.PlayBtn];
    
    self.MiddelImageView.layer.masksToBounds = YES;
    self.MiddleImg = self.MiddelImageView.image;
    
    [self.MiddelImageView.layer removeAnimationForKey:@"playAnnimation"];
    
    CABasicAnimation *basicAnnimation =[[CABasicAnimation alloc]init];
    ///围绕着z轴旋转
    basicAnnimation.keyPath =  @"transform.rotation.z";
    ///所改变属性的起始值
    basicAnnimation.fromValue = @0;
    ///所改变属性的结束值
    basicAnnimation.toValue = @(M_PI * 2);
    ///动画的时长
    basicAnnimation.duration = 30;
    
    //    speed两点需注意的：
    //    (1) 如果设置动画时间为4s，speed设置为2，则动画只需2s即可执行完。
    //    (2)如果同时设置了动画的speed和layer 的speed，则实际的speed为两者相乘。

    ///动画执行的速度
//    basicAnnimation.speed = 2;
    
    
    ///动画重复的次数
    basicAnnimation.repeatCount = MAXFLOAT;
    ///动画完成后是否移除
    basicAnnimation.removedOnCompletion = NO;
    
    [self.MiddelImageView.layer addAnimation:basicAnnimation forKey:@"playAnnimation"];
    [self.MiddelImageView.layer  pauseAnimate];
    
    
    [self.PlayBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlay:) name:@"playState" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
    
}


-(void)isPlayerPlay:(NSNotification *)notification
{
    BOOL isPlay =[notification.object boolValue];
    self.isPlaying = isPlay;
}
-(void)setPlayImage:(NSNotification *)notification
{
    
    UIImage *image = notification.object;
    self.MiddleImg = image;
}

-(void)BtnClick:(UIButton *)btn
{
    if (self.middleClickBlock) {
        self.middleClickBlock(self.isPlaying);
    }
}

-(void)setIsPlaying:(BOOL)isPlaying
{
    if (_isPlaying == isPlaying) {
        
        return;
    }
    
    _isPlaying = isPlaying;
    if (isPlaying) {
        [self.PlayBtn setImage:nil forState:UIControlStateNormal];
        [self.MiddelImageView.layer resumeAnimate];
    }
    else
    {
        UIImage *image =[UIImage imageNamed:@"tabbar_np_play"];
        [self.PlayBtn setImage:image forState:UIControlStateNormal];
        [self.MiddelImageView.layer pauseAnimate];
    }
}

-(void)setMiddleImg:(UIImage *)MiddleImg
{
    _MiddleImg = MiddleImg;
    self.MiddelImageView.image = MiddleImg;
}




-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end










