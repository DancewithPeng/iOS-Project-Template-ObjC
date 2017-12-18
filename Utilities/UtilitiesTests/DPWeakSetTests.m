//
//  DPWeakSetTests.m
//  UtilitiesTests
//
//  Created by 张鹏 on 2017/12/17.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DPWeakSet.h"

@interface DPWeakSetTests : XCTestCase

@end

@implementation DPWeakSetTests

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
    
    DPWeakSet *set = [[DPWeakSet alloc] init];
    
    // 添加
    for (int i=0; i<10000; i++) {
        if (i%2 == 0) {
            [set addObject:nil];
        } else {
            [set addObject:@"test"];
        }
    }
    
    // This is an example of a performance test case.
    [self measureBlock:^{
        [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
//            NSLog(@"obj: %@", obj);
            NSString *s = obj;
        }];
    }];
}

@end
