//
//  JSBridgeExport.h
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/6.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSBridgeExport <JSExport>

// get请求接口
JSExportAs(getRequest,
           - (void)getRequest:(NSString *)URL params:(NSDictionary *)params callback:(JSValue *)callback);

// post请求接口
JSExportAs(postRequest,
           - (void)postRequest:(NSString *)URL params:(NSDictionary *)params callback:(JSValue *)callback);

// debug日志输出接口
JSExportAs(log, - (void)console:(NSString *)message);

// router跳转接口
JSExportAs(router, - (void)router:(NSString *)path);

// 通用回调接口
JSExportAs(callObjC,
           - (void)callObjC:(NSString *)methodName params:(NSDictionary *)params callback:(JSValue *)callback);

@end
