//
//  User.h
//  UserModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCopying>

@property (nonatomic, readonly) BOOL isLogin;

+ (instancetype)currentUser;

@end
