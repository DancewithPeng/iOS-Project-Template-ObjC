//
//  User.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)currentUser {
    User *u = [[User alloc] init];
    return u;
}

#pragma mark - Setter & Getter

- (BOOL)isLogin {
    return NO;
}

@end
