//
//  NSNumberCaculatorTest.m
//  WebViewDemo
//
//  Created by zhangyinglong on 16/7/3.
//  Copyright © 2016年 ChinaHR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+Caculator.h"

@interface NSNumberCaculatorTest : XCTestCase

@end

@implementation NSNumberCaculatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)test_Number_Add_method {
    NSNumber *tmp = [NSNumber makeCaculator:^(CaculatorProxy *make) {
        make.add(@(100));
    }];
    XCTAssert([tmp isEqualToNumber:@(100)], @"test_Number_Add_method ok");
}

- (void)test_Number_Sub_method {
    NSNumber *tmp = [NSNumber makeCaculator:^(CaculatorProxy *make) {
        make.sub(@(100));
    }];
    XCTAssert([tmp isEqualToNumber:@(-100)], @"test_Number_Sub_method ok");
}

- (void)test_Number_Muitl_method {
    NSNumber *tmp = [NSNumber makeCaculator:^(CaculatorProxy *make) {
        make.muilt(@(100));
    }];
    XCTAssert([tmp isEqualToNumber:@(0)], @"test_Number_Muitl_method ok");
}

- (void)test_Number_Devide_method {
    NSNumber *tmp = [NSNumber makeCaculator:^(CaculatorProxy *make) {
        make.devide(@(100));
    }];
    XCTAssert([tmp isEqualToNumber:@(0)], @"test_Number_Devide_method ok");
}

@end
