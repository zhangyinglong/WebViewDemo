//
//  UIFactory.m
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/2.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+ (UIButton *)creactCommoButton:(CGRect)frame
                           text:(NSString *)text
                      textColor:(UIColor *)textColor
                         normal:(UIImage *)normal
                      highlight:(UIImage *)highlight
                        disable:(UIImage *)disable {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.layer.cornerRadius = 4.0f;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor clearColor];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateHighlighted];
    [btn setTitle:text forState:UIControlStateDisabled];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateHighlighted];
    [btn setTitleColor:textColor forState:UIControlStateDisabled];
    if ( normal ) {
        [btn setBackgroundImage:normal forState:UIControlStateNormal];
    }
    if ( highlight ) {
        [btn setBackgroundImage:highlight forState:UIControlStateHighlighted];
    }
    if ( disable ) {
        [btn setBackgroundImage:disable forState:UIControlStateDisabled];
    }
    return btn;
}

@end
