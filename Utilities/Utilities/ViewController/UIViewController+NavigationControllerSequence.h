//
//  UIViewController+NavigationControllerSequence.h
//  Utilities
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 获取导航控制器栈序列中的便捷方法
 */
@interface UIViewController (NavigationControllerSequence)

- (UIViewController *)previousViewController;
- (UIViewController *)nextViewController;
- (NSInteger)indexInNavigationControllerSequence;

@end
