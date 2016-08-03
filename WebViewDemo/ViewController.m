
//  ViewController.m
//  testJSPatch
//
//  Created by sq on 15/6/29.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+JavaScript.h"
#import "NSNumber+Caculator.h"
#import "UIFactory.h"

@interface ViewController () <UIWebViewDelegate> {
    UIWebView * _webView;
}

@end


@implementation ViewController

- (BOOL)willDealloc {
    return NO;
}

- (void)dealloc {
    [_webView stopLoading];
    NSLog(@"ViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WebView Demo";
    self.edgesForExtendedLayout = 0;
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    _webView.delegate = self;
    _webView.hidden = YES;
    [self.view addSubview:_webView];
    [self loadweb];
    
    [self initSubVies];
}

- (void)initSubVies {
//    UIButton *btn = [UIFactory creactCommoButton:CGRectMake(0, 0, 100, 44)
//                                            text:@"test button"
//                                       textColor:[UIColor blackColor]
//                                          normal:nil
//                                       highlight:nil
//                                         disable:nil];
    
//    UIButton *btn = [[[[[[[[UIButton buttonWithType:UIButtonTypeCustom]
//                           frame:CGRectMake(0, 0, 100, 44)]
//                          center:self.view.center]
//                     normalTitle:@"normal"]
//                highlightedTitle:@"highlighted"]
//                   disabledTitle:@"disable"]
//                   selectedTitle:@"selected"]
//                       onClicked:^(UIButton *sender) {
//                           [self sayHello];
//                       }];
//    [self.view addSubview:btn];
    
//    NSNumber *tmp = @(10);
//    NSNumber *result = [NSNumber makeCaculator:^(CaculatorProxy *make) {
//        make.add(tmp).muilt(@(2)).add(@(40));
//    }];
//    NSLog(@"result = %@", result);
}

- (void)configJSContextForWebView:(UIWebView*)webView {
    __weak typeof(self) weakSelf = self;
    void (^push)() = ^{
        DO_TASK_IN_MAIN_QUEUE(
            [weakSelf.navigationController pushViewController:[ViewController new] animated:YES];
        );
    };

    void (^reload)() = ^{
        DO_TASK_IN_MAIN_QUEUE(
            [_webView reload];
        );
    };

    [_webView addJavaScripInterfaces:push withJSObejectNameOrFunctionName:@"push"];

    [_webView addJavaScripInterfaces:reload withJSObejectNameOrFunctionName:@"reload"];

    [webView addJavaScripInterfaces:[JavaScripService new] withJSObejectNameOrFunctionName:@"bridge"];
}

- (void)loadweb {
    _webView.hidden = NO;
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"testWebView" withExtension: @"html"];
//    NSURL *htmlURL = [NSURL URLWithString:@"http://www.163.com"];
    [_webView loadRequest:[[NSURLRequest alloc] initWithURL:htmlURL]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self configJSContextForWebView:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
