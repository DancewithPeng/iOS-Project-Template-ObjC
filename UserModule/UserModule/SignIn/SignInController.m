//
//  SignInController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignInController.h"
#import "SignInViewController.h"

@interface SignInController ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation SignInController

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    if (self = [super init]) {
        self.navigationController = navigationController;
    }
    
    return self;
}

- (void)start {
    SignInViewController *signInVC = [[SignInViewController alloc] init];
    [self.navigationController pushViewController:signInVC animated:YES];
}

@end
