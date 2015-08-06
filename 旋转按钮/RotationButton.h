//
//  RotationButton.h
//  旋转按钮
//
//  Created by GXY on 15/8/5.
//  Copyright (c) 2015年 Tangxianhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotationCircle.h"
#import "ViewFrameAccessor.h"

#define CORNERRADIUS 20.f

@class RotationButton;

@protocol RotationCircleDelegate <NSObject>

@optional
- (void)onClickRotationButton:(RotationButton *)rButton ImageView:(UIImage *)rotationImage;

@end

@interface RotationButton : UIButton

// 以下IBOutlet属性，如果用于在storyboard自动布局，必须全部都关联上。非自动布局，用frame生成可不管！
// 只需设置 rotationDelegate 代理对象，即可监听按钮点击事件。
@property (weak, nonatomic) IBOutlet id <RotationCircleDelegate> rotationDelegate;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contraint_left;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contraint_right;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contraint_height;

/**
 *  展示加载动画
 */
- (void)showCircleRotation;

/**
 *  还原为初始状态
 */
- (void)reductionRotation:(NSString *)title;

@end


