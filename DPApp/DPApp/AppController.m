//
//  AppController.m
//  DPApp
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "AppController.h"
#import <UserModule/UserModule.h>
#import "MainViewController.h"
#import <Utilities/Utilities.h>
#import <AFNetworking/AFNetworking.h>

/** 当前 framework 对应的 bundle */
#define CurrentBundle [NSBundle bundleForClass:[self class]]

@interface AppController ()

@end

@implementation AppController

- (void)start {
    if ([User currentUser].isLogin == YES) {
        [self showMain];
    } else {
        [self showLogin];
    }
}

- (void)showMain {
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self.baseViewController showChildViewController:mainVC];
//    [self.navigationController pushViewController:mainVC animated:NO];
//
    [[AFHTTPSessionManager manager] GET:@"https://www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)showLogin {
    
    NSLog(@"%@", CurrentBundle);
    SignInController *signInController = [[SignInController alloc] initWithBaseViewController:self.baseViewController];
    [self addChildController:signInController];
    [signInController start];
}

@end
