//
//  UIViewController+ShowChildViewController.h
//  Utilities
//
//  Created by 张鹏 on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 方便展示子视图控制器的扩展
 */
@interface UIViewController (ShowChildViewController)

/**
 显示子视图控制器

 @param childViewController 子视图控制器
 */
- (void)showChildViewController:(UIViewController *)childViewController;


/**
 隐藏并且移除子视图控制器

 @param childViewController 子视图控制器
 */
- (void)hideChildViewController:(UIViewController *)childViewController;


/**
 在指定的父视图控制器上显示自己

 @param parentViewController 父视图控制器
 */
- (void)showOnParentViewController:(UIViewController *)parentViewController;


/**
 从父视图控制器上隐藏并移除自己
 */
- (void)hideFromParentViewController;

@end
