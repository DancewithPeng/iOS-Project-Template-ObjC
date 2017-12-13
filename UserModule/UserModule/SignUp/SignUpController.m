//
//  SignUpController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignUpController.h"
#import "SignUpViewController.h"

@interface SignUpController ()

@end

@implementation SignUpController

- (void)start {
    SignUpViewController *signUpVC = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:signUpVC animated:YES];
}

@end
