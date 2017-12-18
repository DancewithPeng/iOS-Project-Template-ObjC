//
//  SignInViewController.h
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Utilities/UILabel+DynamicFont.h>

typedef void(^SignInFinished)(BOOL isSuccess, NSError *error);

@protocol SignInViewControllerDelegate <NSObject>

- (void)signInWithUsername:(NSString *)username password:(NSString *)password finished:(SignInFinished)finishedHanlder;

- (void)signUp;

@end

@interface SignInViewController : UIViewController

@property (nonatomic, weak) id<SignInViewControllerDelegate> delegate;
@property (nonatomic, copy) NSString *defaultUsername;
@property (nonatomic, copy) NSString *defaultPassword;

@end
