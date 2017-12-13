//
//  SignUpController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignUpController.h"
#import "SignUpViewController.h"
#import "SignUpSupplementaryViewController.h"
#import <Utilities/UIViewController+FrameworkNib.h>
#import "User.h"

@interface SignUpController () <SignUpViewControllerDelegate, SignUpSupplementaryViewControllerDelegate>

@property (nonatomic, weak) SignUpViewController *signUpVC;

@end

@implementation SignUpController

- (void)start {
    SignUpViewController *signUpVC = [SignUpViewController viewControllerWithNib];
    signUpVC.delegate = self;
    signUpVC.supplementary = @"Hello World!";
    [self.navigationController pushViewController:signUpVC animated:YES];
    self.signUpVC = signUpVC;        
}

#pragma mark - SignUpViewControllerDelegate

// 补充信息
- (void)supplementSignUpInformationWithCompletionHandler:(void (^)(BOOL, NSDictionary *))completionHandler {
    
    // 跳转到补充信息页面
    SignUpSupplementaryViewController *supplementaryVC = [SignUpSupplementaryViewController viewControllerWithNib];
    supplementaryVC.delegate = self;
//    [self.navigationController pushViewController:supplementaryVC animated:YES];
    [self.navigationController presentViewController:supplementaryVC animated:YES completion:nil];
}

// 注册
- (void)signUpWithUsername:(NSString *)username password:(NSString *)password completionHandler:(void (^)(BOOL))complectionHandler {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (complectionHandler != nil) {
            complectionHandler(YES);
        }
        [self.navigationController popViewControllerAnimated:YES];
        
        if ([self.delegate respondsToSelector:@selector(signUpController:completion:withInfo:)]) {
            [self.delegate signUpController:self completion:YES withInfo:@{@"username": username, @"password": password}];
        }
    });
}

#pragma mark - SignUpSupplementaryViewControllerDelegate

// 补充信息完成
- (void)supplementFinishedWithInfo:(NSDictionary *)info completionHandler:(void (^)(void))completionHandler {
    // 把信息传给SignUpVC
    self.signUpVC.supplementary = info[@"Supplementary"];
//    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)supplementaryVCBackBBIDidClicked:(id)sender {
    NSLog(@"Hello World!");
}

@end
