//
//  NSNumber+Caculator.h
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/3.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CaculatorProxy;
@interface NSNumber (Caculator)

+ (NSNumber *)makeCaculator:(void(^)(CaculatorProxy *make))caculator;

@end

@interface CaculatorProxy : NSObject

@property (nonatomic, readonly) NSNumber *result;

- (CaculatorProxy *(^)(NSNumber *))add;

- (CaculatorProxy *(^)(NSNumber *))sub;

- (CaculatorProxy *(^)(NSNumber *))muilt;

- (CaculatorProxy *(^)(NSNumber *))devide;

@end
