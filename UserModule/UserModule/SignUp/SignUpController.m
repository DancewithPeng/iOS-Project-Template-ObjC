//
//  SignUpController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignUpController.h"

@interface SignUpController ()

@property (nonatomic, strong) NSMutableArray<FlowController> *childControllers;

@property (nonatomic, strong) NSArray<NSString *> *test;

@end

@implementation SignUpController

- (void)start {
    
}

- (void)addChildController:(id<FlowController>)childController {
    [self.childControllers addObject:childController];
}

@end
