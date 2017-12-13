//
//  UIViewController+ShowChildViewController.m
//  Utilities
//
//  Created by 张鹏 on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "UIViewController+ShowChildViewController.h"

@implementation UIViewController (ShowChildViewController)

- (void)showChildViewController:(UIViewController *)childViewController {
    
    // yichu
    [self addChildViewController:childViewController];
    
    [self.view addSubview:childViewController.view];
    
    // view
    [childViewController didMoveToParentViewController:self];
}

- (void)hideChildViewController:(UIViewController *)childViewController {
    
    [childViewController willMoveToParentViewController:nil];
    
    [childViewController.view removeFromSuperview];
    
    [childViewController removeFromParentViewController];
}

- (void)showOnParentViewController:(UIViewController *)parentViewController {
    [parentViewController showChildViewController:self];
}

- (void)hideFromParentViewController {
    [self.parentViewController hideChildViewController:self];
}

@end
