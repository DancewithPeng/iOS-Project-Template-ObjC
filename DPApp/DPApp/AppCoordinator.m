//
//  AppCoordinator.m
//  DPApp
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "AppCoordinator.h"
#import "MainCoordinator.h"

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
    MainCoordinator *mainCoordinator = [[MainCoordinator alloc] initWithBaseViewController:self.baseViewController];
    [self addChildCoordinator:mainCoordinator];
    [mainCoordinator start];
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
    [self removeChildCoordinator:signInCoordinator];
    [self showMain];
}

// 取消
- (void)coordinatorDidCancel:(SignInCoordinator *)signInCoordinator {
    
}

@end
