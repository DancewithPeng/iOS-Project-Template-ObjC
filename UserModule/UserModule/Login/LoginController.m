//
//  LoginController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "LoginController.h"
#import "LoginViewController.h"
#import <Utilities/Utilities.h>

@interface LoginController ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation LoginController

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    if (self = [super init]) {
        self.navigationController = navigationController;
    }
    return self;
}

- (void)start {
    LoginViewController *loginVC = [LoginViewController viewControllerWithNib];
    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
