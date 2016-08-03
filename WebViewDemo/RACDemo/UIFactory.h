//
//  UIFactory.h
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/2.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIButton+Block.h"

@interface UIFactory : NSObject

+ (UIButton *)creactCommoButton:(CGRect)frame
                           text:(NSString *)text
                      textColor:(UIColor *)textColor
                         normal:(UIImage *)normal
                      highlight:(UIImage *)highlight
                        disable:(UIImage *)disable;

@end
