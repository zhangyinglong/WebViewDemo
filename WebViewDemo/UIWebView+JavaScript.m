//
//  UIWebView+JavaScript.m
//  Common
//
//  Created by zhangyinglong on 16/6/15.
//  Copyright © 2016年 DLL. All rights reserved.
//

#import "UIWebView+JavaScript.h"
#import <objc/runtime.h>

@interface UIWebView_JavaScript_Proxy : NSObject

@property (nonatomic, strong) NSMutableDictionary *interfaces;

@end

@implementation UIWebView_JavaScript_Proxy

- (NSMutableDictionary *)interfaces {
    if ( _interfaces == nil ) {
        _interfaces = [NSMutableDictionary dictionary];
    }
    return _interfaces;
}

@end

@implementation UIWebView (JavaScript)

+ (void)swizzleMethod:(SEL)selector withMethod:(SEL)otherSelector {
    // my own class is being targetted
    Class c = [self class];
    
    // get the methods from the selectors
    Method originalMethod = class_getInstanceMethod(c, selector);
    Method otherMethod    = class_getInstanceMethod(c, otherSelector);
    
    if (class_addMethod(c, selector, method_getImplementation(otherMethod), method_getTypeEncoding(otherMethod))) {
        class_replaceMethod(c, otherSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, otherMethod);
    }
}

+ (void)load {
    [self swizzleMethod:@selector(setDelegate:) withMethod:@selector(setCustomDelegate:)];
}

static char kUIWebView_JavaScript_Proxy_key;
- (void)setWebViewProxy:(UIWebView_JavaScript_Proxy *)proxy {
    objc_setAssociatedObject(self, &kUIWebView_JavaScript_Proxy_key, proxy, OBJC_ASSOCIATION_RETAIN);
}

- (UIWebView_JavaScript_Proxy *)webViewProxy {
    return objc_getAssociatedObject(self, &kUIWebView_JavaScript_Proxy_key);
}

- (void)setCustomDelegate:(id <UIWebViewDelegate>)delegate {
    [self setWebViewProxy:[[UIWebView_JavaScript_Proxy alloc] init]];
    [self setCustomDelegate:delegate];
}

- (JSContext *)jsContext {
    return [self valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
}

- (void)addJavaScripInterfaces:(id)interface withJSObejectNameOrFunctionName:(NSString *)name {
    NSAssert(self.delegate != nil, @"UIWebView is delegate can not nil");
    if ( interface ) {
        UIWebView_JavaScript_Proxy *proxy = [self webViewProxy];
        proxy.interfaces[name] = interface;
        [self.jsContext setObject:interface forKeyedSubscript:name];
    }
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
}

@end
