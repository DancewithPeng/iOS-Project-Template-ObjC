//
//  SignUpSupplementaryViewController.h
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignUpSupplementaryViewControllerDelegate <NSObject>

// 补充信息完成
- (void)supplementFinishedWithInfo:(NSDictionary *)info completionHandler:(void (^)(void))completionHandler;

@end

@interface SignUpSupplementaryViewController : UIViewController

@property (nonatomic, weak) id<SignUpSupplementaryViewControllerDelegate> delegate;

@end
