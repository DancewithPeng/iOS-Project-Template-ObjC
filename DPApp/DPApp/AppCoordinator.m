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

@interface AppCoordinator ()

@end

@implementation AppCoordinator

- (void)startWithCompletion:(FlowCompletionHandler)completion {
    [super startWithCompletion:completion];
    
    [self showMain];
}

- (void)showMain {
    
    MainCoordinator *mainCoordinator = [[MainCoordinator alloc] initWithBaseViewController:self.baseViewController];
    [self addChildCoordinator:mainCoordinator];
        
    [mainCoordinator startWithCompletion:nil];
//    [mainCoordinator start];
}

- (void)showLogin {
    SignInCoordinator *signInCoordinator = [[SignInCoordinator alloc] initWithBaseViewController:self.baseViewController];
    [self addChildCoordinator:signInCoordinator];
//    [signInCoordinator start];
}

#pragma mark - SignInCoordinatorDelegate


@end
