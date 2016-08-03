//
//  RootoViewController.m
//  WebViewDemo
//
//  Created by zhangyinglong on 16/8/3.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import "RootoViewController.h"
#import "ViewController.h"

@interface RootoViewController ()

@end

@implementation RootoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 44);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)push {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

@end
