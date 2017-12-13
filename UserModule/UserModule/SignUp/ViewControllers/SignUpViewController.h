//
//  SignUpViewController.h
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SignUpViewControllerDelegate <NSObject>

// 补充用户信息
- (void)supplementSignUpInformationWithCompletionHandler:(void (^)(BOOL isCancel, NSDictionary *info))completionHandler;

// 注册
- (void)signUpWithUsername:(NSString *)username password:(NSString *)password completionHandler:(void (^)(BOOL isSucceed))complectionHandler;

@end

@interface SignUpViewController : UIViewController

// 需要的参数，额外信息
@property (nonatomic, copy) NSString *supplementary;

@property (nonatomic, weak) id<SignUpViewControllerDelegate> delegate;

@end
