//
//  BaseFlowCoordinator.h
//  Utilities
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowCoordinator.h"
#import "UIViewController+LifeCycleHook.h"

@interface BaseFlowCoordinator : NSObject <FlowCoordinator, UIViewControllerLifeCycleHooker>

#pragma mark - FlowCoordinator

@property (nonatomic, readonly) NSArray<id<FlowCoordinator>> *childCoordinators;
@property (nonatomic, copy) FlowCompletionHandler completion;

- (void)startWithCompletion:(FlowCompletionHandler)completion;
- (void)cancelWithError:(NSError *)error;
- (void)finishWithInfo:(id)userInfo;

- (void)addChildCoordinator:(id<FlowCoordinator>)childCoordinator;
- (void)removeChildCoordinator:(id<FlowCoordinator>)childCoordinator;



#pragma mark - Extension


/**
 基础视图控制器
 */
@property (nonatomic, weak, readonly) UIViewController *baseViewController;


/**
 导航控制器，如果 baseController不是UINavigationController，则返回nil
 */
@property (nonatomic, readonly) UINavigationController  *navigationController;


/**
 分栏控制器，如果 baseController不是UITabBarController，则返回nil
 */
@property (nonatomic, readonly) UITabBarController      *tabBarController;


/**
 初始化方法，并指定基础控制器
 
 @param baseViewController 基础控制器
 @return 返回初始化完成的对象
 */
- (instancetype)initWithBaseViewController:(UIViewController *)baseViewController;

@end
