//
//  NSNumber+Caculator.m
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/3.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import "NSNumber+Caculator.h"

@implementation NSNumber (Caculator)

+ (NSNumber *)makeCaculator:(void(^)(CaculatorProxy *make))caculator {
    CaculatorProxy *proxy = [[CaculatorProxy alloc] init];
    caculator(proxy);
    return proxy.result;
}

@end

@implementation CaculatorProxy

- (CaculatorProxy *(^)(NSNumber *))add {
    return ^CaculatorProxy *(NSNumber *value) {
        _result = [NSNumber numberWithFloat:(_result.floatValue + value.floatValue)];
        return self;
    };
}

- (CaculatorProxy *(^)(NSNumber *))sub {
    return ^CaculatorProxy *(NSNumber *value) {
        _result = [NSNumber numberWithFloat:(_result.floatValue - value.floatValue)];
        return self;
    };
}

- (CaculatorProxy *(^)(NSNumber *))muilt {
    return ^CaculatorProxy *(NSNumber *value) {
        _result = [NSNumber numberWithFloat:(_result.floatValue * value.floatValue)];
        return self;
    };
}

- (CaculatorProxy *(^)(NSNumber *))devide {
    return ^CaculatorProxy *(NSNumber *value) {
        _result = [NSNumber numberWithFloat:(_result.floatValue / value.floatValue)];
        return self;
    };
}

@end
