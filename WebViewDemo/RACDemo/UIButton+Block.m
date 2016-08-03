//
//  UIButton+Block.m
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/2.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static char kUIButtonBlock;

@implementation UIButton (Block)

- (UIButton *)center:(CGPoint)center {
    self.center = center;
    return self;
}

- (UIButton *)frame:(CGRect)frame {
    self.frame = frame;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    return self;
}

- (UIButton *)normalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return self;
}

- (UIButton *)highlightedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    return self;
}

- (UIButton *)disabledTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    return self;
}

- (UIButton *)selectedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    return self;
}

- (UIButton *)onClicked:(void(^)(UIButton *sender))block {
    if (block) {
        objc_setAssociatedObject(self, &kUIButtonBlock, block, OBJC_ASSOCIATION_COPY);
        [self addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark -- private method

- (void)clicked:(UIButton *)sender {
    void(^block)(UIButton *sender) = objc_getAssociatedObject(self, &kUIButtonBlock);
    if (block) {
        block(self);
    }
}

@end
