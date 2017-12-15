//
//  AppCoordinator.m
//  DPApp
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "AppCoordinator.h"
#import "MainViewController.h"

#import <UserModule/User.h>
#import <UserModule/SignInCoordinator.h>
#import <Utilities/UIViewController+ShowChildViewController.h>
#import <AFNetworking/AFNetworking.h>

@interface AppCoordinator () <SignInCoordinatorDelegate>

@end

@implementation AppCoordinator

- (void)start {
    if ([User currentUser].isLogin == YES) {
        [self showMain];
    } else {
        [self showLogin];
    }
}

- (void)showMain {
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [self.baseViewController showChildViewController:nav];
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
    SignInCoordinator *signInCoordinator = [[SignInCoordinator alloc] initWithBaseViewController:self.baseViewController];
    signInCoordinator.delegate = self;
    [self addChildCoordinator:signInCoordinator];
    [signInCoordinator start];
}

#pragma mark - SignInCoordinatorDelegate

// 登录成功
- (void)coordinatorDidSignIn:(SignInCoordinator *)signInCoordinator {
    [self showMain];
}

// 取消
- (void)coordinatorDidCancel:(SignInCoordinator *)signInCoordinator {
    
}

@end
