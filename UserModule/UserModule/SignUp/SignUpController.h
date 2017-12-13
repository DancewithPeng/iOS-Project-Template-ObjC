//
//  SignUpController.h
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Utilities/BaseFlowController.h>

@class SignUpController;
@protocol SignUpControllerDelegate <NSObject>

- (void)signUpController:(SignUpController *)signUpVC completion:(BOOL)isSucceed withInfo:(NSDictionary *)info;

@end

@interface SignUpController : BaseFlowController

@property (nonatomic, weak) id<SignUpControllerDelegate> delegate;

@end
