//
//  SignInCoordinator.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignInCoordinator.h"
#import "SignInViewController.h"

@interface SignInCoordinator () <SignInViewControllerDelegate>

@property (nonatomic, weak) SignInViewController *signVC;

@end

@implementation SignInCoordinator

- (void)start {
    
    // 显示登录页面
    SignInViewController *signVC = [SignInViewController viewControllerWithNib];
    signVC.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signVC];
    [self.baseViewController showChildViewController:nav];
    self.signVC = signVC;
}

#pragma mark - SignInViewControllerDelegate

// 登录
- (void)signInWithUsername:(NSString *)username password:(NSString *)password finished:(SignInFinished)finishedHanlder {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 登录成功
        
        // 隐藏登录界面
        [self.signVC.navigationController hideFromParentViewController];
        
        // 回调
        if ([self.delegate respondsToSelector:@selector(coordinatorDidSignIn:)]) {
            [self.delegate coordinatorDidSignIn:self];
        }
    });
}

// 注册
- (void)signUp {
    
}

@end
