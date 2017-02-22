//
//  CALayer+PauseAnimate.h
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (PauseAnimate)

///暂停动画
-(void)pauseAnimate;

///恢复动画
-(void)resumeAnimate;

@end
