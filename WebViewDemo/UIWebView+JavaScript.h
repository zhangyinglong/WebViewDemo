//
//  UIWebView+JavaScript.h
//  Common
//
//  Created by zhangyinglong on 16/6/15.
//  Copyright © 2016年 DLL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

#define DO_TASK_IN_MAIN_QUEUE(exp) do { \
                                       dispatch_async(dispatch_get_main_queue(), ^{ \
                                           exp; \
                                       }); \
                                   } while(0)

@interface UIWebView (JavaScript)

- (JSContext *)jsContext;

- (void)addJavaScripInterfaces:(id)interface withJSObejectNameOrFunctionName:(NSString *)name;

@end
