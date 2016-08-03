//
//  JavaScripService.m
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/6.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import "JavaScripService.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface JavaScripService (Bridge)

@end

@implementation JavaScripService

- (void)getRequest:(NSString *)URL params:(NSDictionary *)params callback:(JSValue *)callback {
    NSLog(@"服务端接口: %@ \n参数: %@", URL, params);
    if ( ![callback isNull] ) {
        [callback callWithArguments:@[ @"get response ok" ]];
    }
}

- (void)postRequest:(NSString *)URL params:(NSDictionary *)params callback:(JSValue *)callback {
    NSLog(@"服务端接口: %@ \n参数: %@", URL, params);
    if ( ![callback isNull] ) {
        [callback callWithArguments:@[ @"post response ok" ]];
    }
}

- (void)console:(NSString *)message {
    NSLog(@"%@", message);
}

- (void)router:(NSString *)path {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ( [path containsString:@"goBack"] ) {
            UINavigationController *navigationController = (UINavigationController *)[[[UIApplication sharedApplication].delegate window] rootViewController];
            [navigationController popViewControllerAnimated:YES];
        } else {
            NSLog(@"router to %@", path);
        }
    });
}

- (void)callObjC:(NSString *)methodName params:(NSDictionary *)params callback:(JSValue *)callback {
    if ( methodName.length > 0 ) {
        [self performSelectorOnMainThread:NSSelectorFromString(methodName)
                               withObject:params
                            waitUntilDone:YES];
    }
}

@end
