//
//  JavaScripService.h
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/6.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JSBridgeExport.h"

@interface JavaScripService : NSObject <JSBridgeExport>

- (void)getRequest:(NSString *)URL params:(NSDictionary *)params callback:(JSValue *)callback;

- (void)postRequest:(NSString *)URL params:(NSDictionary *)params callback:(JSValue *)callback;

- (void)console:(NSString *)message;

- (void)router:(NSString *)path;

- (void)callObjC:(NSString *)methodName params:(NSString *)params callback:(JSValue *)callback;

@end
