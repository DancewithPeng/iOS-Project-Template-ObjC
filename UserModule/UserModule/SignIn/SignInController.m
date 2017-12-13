//
//  SignInController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignInController.h"
#import "SignInViewController.h"
#import "SignUpController.h"

#import <Utilities/UIViewController+ShowChildViewController.h>
#import <Utilities/UIViewController+FrameworkNib.h>

@interface SignInController () <SignInViewControllerDelegate>

@property (nonatomic, weak) SignInViewController *signInVC;

@end

@implementation SignInController

- (void)start {
    // 显示登陆页面
    SignInViewController *signInVC = [SignInViewController viewControllerWithNib];
    signInVC.defaultUsername = @"哈哈哈";
    signInVC.defaultPassword = @"略略略";
    signInVC.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signInVC];
    [self.baseViewController showChildViewController:nav];
    self.signInVC = signInVC;
}

#pragma mark - SignInViewControllerDelegate

- (void)signInWithUsername:(NSString *)username password:(NSString *)password finished:(SignInFinished)finishedHanlder {
    NSLog(@"登陆：%@, %@", username, password);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        finishedHanlder(YES, nil);
    });
}

- (void)signUp {
    SignUpController *signUp = [[SignUpController alloc] initWithBaseViewController:self.signInVC.navigationController];
    [self addChildController:signUp];
    [signUp start];
}

@end
