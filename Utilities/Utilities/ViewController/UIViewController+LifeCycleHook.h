//
//  UIViewController+LifeCycleHook.h
//  Utilities
//
//  Created by DancewithPeng on 2018/1/15.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPWeakSet.h"

@protocol UIViewControllerLifeCycleHooker <NSObject>

@optional
- (void)viewControllerViewDidLoad:(UIViewController *)viewController;
- (void)viewController:(UIViewController *)viewController viewWillAppear:(BOOL)animated;
- (void)viewController:(UIViewController *)viewController viewDidAppear:(BOOL)animated;
- (void)viewController:(UIViewController *)viewController viewWillDisappear:(BOOL)animated;
- (void)viewController:(UIViewController *)viewController viewDidDisappear:(BOOL)animated;
- (void)viewControllerDealloc:(UIViewController *)viewController;

@end

@interface UIViewController (LifeCycleHook)

@property (nonatomic, readonly) DPWeakSet *hookerSet;

- (void)addHooker:(id<UIViewControllerLifeCycleHooker>)hooker;
- (void)removeHooker:(id<UIViewControllerLifeCycleHooker>)hooker;

@end
