//
//  SignInCoordinator.h
//  UserModule
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Utilities/Utilities.h>

@class SignInCoordinator;
@protocol SignInCoordinatorDelegate <NSObject>

// 登录成功
- (void)coordinatorDidSignIn:(SignInCoordinator *)signInCoordinator;

// 取消
- (void)coordinatorDidCancel:(SignInCoordinator *)signInCoordinator;

@end

@interface SignInCoordinator : BaseFlowCoordinator

@property (nonatomic, weak) id<SignInCoordinatorDelegate> delegate;

@end
