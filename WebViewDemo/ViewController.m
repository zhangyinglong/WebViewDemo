
//  ViewController.m
//  testJSPatch
//
//  Created by sq on 15/6/29.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+JavaScript.h"

@protocol JSViewController<JSExport>

- (NSString *)sayHello;

@end

@interface ViewController ()<UIWebViewDelegate,JSViewController>{
    UIWebView* webView;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"WebView Demo";
    self.edgesForExtendedLayout = 0;
    webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    webView.delegate = self;
    webView.hidden = YES;
    [self.view addSubview:webView];
    [self configJSContextForWebView:webView];
    [self loadweb];
    
}

- (void)configJSContextForWebView:(UIWebView*)_webView {
    void (^push)() = ^{
        DO_TASK_IN_MAIN_QUEUE(
            [self.navigationController pushViewController:[ViewController new] animated:YES];
        );
    };
    
    void (^reload)() = ^{
        DO_TASK_IN_MAIN_QUEUE(
            [_webView reload];
        );
    };
    
    [_webView addJavaScripInterfaces:push withJSObejectNameOrFunctionName:@"push"];
    
    [_webView addJavaScripInterfaces:reload withJSObejectNameOrFunctionName:@"reload"];
    
    [_webView addJavaScripInterfaces:self withJSObejectNameOrFunctionName:@"viewController"];
    
}

- (void)loadweb {
    webView.hidden =NO;
    
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"testWebView"
                                             withExtension: @"html"];
    
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:htmlURL]];
    
}

- (NSString *)sayHello {
    NSArray *array = @[ @"say Hello JavaScript",
                        @"say Hello iOS",
                        @"say Hello Android",
                        @"say Hello Node.js" ];
    NSString *message = array[(arc4random() % 4)];
    [[[UIAlertView alloc] initWithTitle:@"Hello Demo"
                               message:message
                              delegate:nil
                     cancelButtonTitle:@"取消"
                     otherButtonTitles:@"确定", nil] show];
    return message;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIView *)genView {
    UIView * testView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    testView.backgroundColor = [UIColor redColor];
    return testView;
}

- (void)tapButton {
    
}

@end
