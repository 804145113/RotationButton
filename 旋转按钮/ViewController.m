//
//  ViewController.m
//  旋转按钮
//
//  Created by GXY on 15/8/5.
//  Copyright (c) 2015年 Tangxianhai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RotationButton *btn = [[RotationButton alloc] initWithFrame:CGRectMake(66, 120, (self.view.width - 66 * 2), 50)];
    btn.rotationDelegate = self;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"代码非自动布局" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

- (void)onClickRotationButton:(RotationButton *)rButton ImageView:(UIImage *)rotationImage {
    [rButton showCircleRotation];
}

@end
