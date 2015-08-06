//
//  RotationButton.m
//  旋转按钮
//
//  Created by GXY on 15/8/5.
//  Copyright (c) 2015年 Tangxianhai. All rights reserved.
//

#import "RotationButton.h"

@implementation RotationButton {
    UIImage *rotationImage;// 旋转的图片，该图片有按钮本身大小自动生成。
    NSTimer *rTimer; // 定时器对象，没什么。
    CGFloat angle;// 该变量用于记录旋转角度。
    
    CGFloat sourceWith;  // 该变量用于非自动布局中记录变化前的按钮宽度。
    
    CGFloat leftPadding; // 该变量用于自动布局，记录设置左边约束的常量值（距离）。
    CGFloat rightPadding; // 该变量用于自动布局，记录设置右边约束的常量值（距离）。
}

#pragma mark - life circle

- (void)drawRect:(CGRect)rect {
    // 根据传过来按钮的rect，动态生成相应大小的旋转图片
    rotationImage = [RotationCircle imageOfCanvas1WithCircleRect:CGRectMake(0, 0, rect.size.height - 20, rect.size.height - 20)];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.cornerRadius = CORNERRADIUS;
        self.layer.masksToBounds = YES;
        [self addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = CORNERRADIUS;
        self.layer.masksToBounds = YES;
        [self addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickMe:(RotationButton *)btn {
    sourceWith = self.width;
    if (_rotationDelegate != nil) {
        [_rotationDelegate onClickRotationButton:self ImageView:rotationImage];
    }
}

- (void)showCircleRotation {
    BOOL autoresizing = self.translatesAutoresizingMaskIntoConstraints;
    if (autoresizing) {
        // 非自动布局
        [UIView animateWithDuration:0.3f animations:^{
            self.transform = CGAffineTransformScale(self.transform, 0.2f, 1.f);
        } completion:^(BOOL finished) {
            self.transform = CGAffineTransformIdentity;
            self.width = self.height;
            self.layer.cornerRadius = self.width / 2;
            self.centerX = self.superview.centerX;
            [self setTitle:@"" forState:UIControlStateNormal];
            [self setImage:rotationImage forState:UIControlStateNormal];
            [self startRotaiton];
        }];
    }
    else {
        [UIView animateWithDuration:0.3f animations:^ {
            self.transform = CGAffineTransformScale(self.transform, 0.2f, 1.f);
        } completion:^(BOOL finished) {
            leftPadding = self.contraint_left.constant;
            rightPadding = self.contraint_right.constant;
            CGFloat padding = ([[UIScreen mainScreen] bounds].size.width - _contraint_height.constant) / 2;
            self.contraint_left.constant = padding;
            self.contraint_right.constant = padding;
            self.layer.cornerRadius = self.height / 2;
            self.centerX = self.superview.centerX;
            [self setTitle:@"" forState:UIControlStateNormal];
            [self setImage:rotationImage forState:UIControlStateNormal];
            [self startRotaiton];
        }];
    }
}

- (void)reductionRotation:(NSString *)title {
    angle = 0.f;
    [rTimer invalidate];
    [self setImage:nil forState:UIControlStateNormal];
    self.transform = CGAffineTransformIdentity;
    BOOL autoresizing = self.translatesAutoresizingMaskIntoConstraints;
    if (autoresizing) {
        // 非自动布局
        self.width = sourceWith;
    }
    else {
        self.contraint_left.constant = leftPadding;
        self.contraint_right.constant = rightPadding;
    }
    self.centerX = self.superview.centerX;
    self.layer.cornerRadius = CORNERRADIUS;
    [self setTitle:title forState:UIControlStateNormal];
    self.userInteractionEnabled = YES;
}

#pragma mark - private method

- (void)startRotaiton {
    self.userInteractionEnabled = NO;
    rTimer = [NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(rotationTimer:) userInfo:nil repeats:YES];
    [rTimer fire];
}

- (void)rotationTimer:(NSTimer *)timer {
    angle += (6.f * M_PI) / 180.0f;
    self.transform = CGAffineTransformMakeRotation(angle);
    if (angle > 10.f) {
        [self reductionRotation:@"登 陆"];
    }
}

- (void)shakeToShow:(UIView*)aView {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    
    [aView.layer addAnimation:animation forKey:nil];
}


@end
