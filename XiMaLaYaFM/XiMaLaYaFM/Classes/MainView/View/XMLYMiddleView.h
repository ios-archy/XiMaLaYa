//
//  XMLYMiddleView.h
//  XiMaLaYaFM
//
//  Created by archy on 17/2/22.
//  Copyright © 2017年 archy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLYMiddleView : UIView

+(instancetype)shareInstance;


///快速创建中间视图
+(instancetype)middleView;


///控制是否正在播放
@property (nonatomic,assign) BOOL isPlaying;

///中间图片
@property (nonatomic,strong)UIImage *MiddleImg;
///点击重点按钮的执行代码块
@property (nonatomic,copy)void(^middleClickBlock)(BOOL isPlaying);

@end
