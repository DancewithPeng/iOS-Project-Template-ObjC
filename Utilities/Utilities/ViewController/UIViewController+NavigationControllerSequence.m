//
//  UIViewController+NavigationControllerSequence.m
//  Utilities
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "UIViewController+NavigationControllerSequence.h"

@implementation UIViewController (NavigationControllerSequence)

- (UIViewController *)nextViewController {
    
    NSInteger selfIndex = [self indexInNavigationControllerSequence];
    if (selfIndex < self.navigationController.viewControllers.count -1 && selfIndex >= 0) {
        return self.navigationController.viewControllers[selfIndex + 1];
    }
    
    return nil;
}

- (UIViewController *)previousViewController {
    
    NSInteger selfIndex = [self indexInNavigationControllerSequence];
    if (selfIndex > 0 && selfIndex <= self.navigationController.viewControllers.count -1) {
        return self.navigationController.viewControllers[selfIndex - 1];
    }
    
    return nil;
}

- (NSInteger)indexInNavigationControllerSequence {
    if ([self.parentViewController  isKindOfClass:[UINavigationController class]]) {
        return [self.navigationController.viewControllers indexOfObject:self];
    }
    
    return -1;
}

@end
