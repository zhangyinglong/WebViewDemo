//
//  UIButton+Block.h
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/2.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Block)

- (UIButton *)center:(CGPoint)center;

- (UIButton *)frame:(CGRect)frame;

- (UIButton *)normalTitle:(NSString *)title;

- (UIButton *)highlightedTitle:(NSString *)title;

- (UIButton *)disabledTitle:(NSString *)title;

- (UIButton *)selectedTitle:(NSString *)title;

- (UIButton *)onClicked:(void(^)(UIButton *sender))block;

@end
