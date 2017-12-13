//
//  BaseFlowController.h
//  Utilities
//
//  Created by 张鹏 on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowController.h"

@interface BaseFlowController : NSObject <FlowController>


#pragma mark - FlowController

@property (nonatomic, readonly) NSArray<id<FlowController>> *childControllers;

- (void)start;

- (void)addChildController:(id<FlowController>)childController;
- (void)removeChildController:(id<FlowController>)childController;


#pragma mark - Extension


/**
 基础视图控制器
 */
@property (nonatomic, strong, readonly) UIViewController    *baseViewController;


/**
 导航控制器，如果 baseController不是UINavigationController，则返回nil
 */
@property (nonatomic, readonly) UINavigationController  *navigationController;


/**
 分栏控制器，如果 baseController不是UITabBarController，则返回nil
 */
@property (nonatomic, readonly) UITabBarController      *tabBarController;


/**
 初始化方法，并制定基础控制器

 @param baseViewController 基础控制器
 @return 初始化号的对象
 */
- (instancetype)initWithBaseViewController:(UIViewController *)baseViewController;

@end
