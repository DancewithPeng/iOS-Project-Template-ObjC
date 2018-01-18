//
//  UIViewController+LifeCycleHook.m
//  Utilities
//
//  Created by DancewithPeng on 2018/1/15.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

#import "UIViewController+LifeCycleHook.h"
#import <objc/runtime.h>

@implementation UIViewController (LifeCycleHook)

@dynamic hookerSet;


#pragma mark - Interfaces

- (void)addHooker:(id<UIViewControllerLifeCycleHooker>)hooker {
    [self.hookerSet addObject:hooker];
}

- (void)removeHooker:(id<UIViewControllerLifeCycleHooker>)hooker {
    [self.hookerSet removeObject:hooker];
}


#pragma mark - Method Swizzling

+ (void)load {
    
    [self swizzleMethodWithOriginalSelector:@selector(viewDidLoad) swizzleSelector:@selector(_dp_swizzle_viewDidLoad)];
    [self swizzleMethodWithOriginalSelector:@selector(viewWillAppear:) swizzleSelector:@selector(_dp_swizzle_viewWillAppear:)];
    [self swizzleMethodWithOriginalSelector:@selector(viewDidAppear:) swizzleSelector:@selector(_dp_swizzle_viewDidAppear:)];
    [self swizzleMethodWithOriginalSelector:@selector(viewWillDisappear:) swizzleSelector:@selector(_dp_swizzle_viewWillDisappear:)];
    [self swizzleMethodWithOriginalSelector:@selector(viewDidDisappear:) swizzleSelector:@selector(_dp_swizzle_viewDidDisappear:)];
    [self swizzleMethodWithOriginalSelector:NSSelectorFromString(@"dealloc") swizzleSelector:@selector(_dp_swizzle_dealloc)];
}

- (void)_dp_swizzle_viewDidLoad {
    [self _dp_swizzle_viewDidLoad];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [self.hookerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id<UIViewControllerLifeCycleHooker> hooker = obj;
        if ([hooker respondsToSelector:@selector(viewControllerViewDidLoad:)]) {
            [hooker viewControllerViewDidLoad:self];
        }
    }];
}

- (void)_dp_swizzle_viewWillAppear:(BOOL)animated {
    [self _dp_swizzle_viewWillAppear:animated];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [self.hookerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id<UIViewControllerLifeCycleHooker> hooker = obj;
        if ([hooker respondsToSelector:@selector(viewController:viewWillAppear:)]) {
            [hooker viewController:self viewWillAppear:animated];
        }
    }];
}

- (void)_dp_swizzle_viewDidAppear:(BOOL)animated {
    [self _dp_swizzle_viewDidAppear:animated];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [self.hookerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id<UIViewControllerLifeCycleHooker> hooker = obj;
        if ([hooker respondsToSelector:@selector(viewController:viewDidAppear:)]) {
            [hooker viewController:self viewDidAppear:animated];
        }
    }];
}

- (void)_dp_swizzle_viewWillDisappear:(BOOL)animated {
    [self _dp_swizzle_viewWillDisappear:animated];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [self.hookerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id<UIViewControllerLifeCycleHooker> hooker = obj;
        if ([hooker respondsToSelector:@selector(viewController:viewWillDisappear:)]) {
            [hooker viewController:self viewWillDisappear:animated];
        }
    }];
}

- (void)_dp_swizzle_viewDidDisappear:(BOOL)animated {
    [self _dp_swizzle_viewDidDisappear:animated];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [self.hookerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id<UIViewControllerLifeCycleHooker> hooker = obj;
        if ([hooker respondsToSelector:@selector(viewController:viewDidDisappear:)]) {
            [hooker viewController:self viewDidDisappear:animated];
        }
    }];
}

- (void)_dp_swizzle_dealloc {
    
//    [self.hookerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
//        id<UIViewControllerLifeCycleHooker> hooker = obj;
//        if ([hooker respondsToSelector:@selector(viewControllerDealloc:)]) {
//            [hooker viewControllerDealloc:self];
//        }
//    }];
    
    [self _dp_swizzle_dealloc];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark - Helper Methods

+ (void)swizzleMethodWithOriginalSelector:(SEL)originalSEL swizzleSelector:(SEL)swizzleSEL {
    
    Method originalMethod = class_getInstanceMethod(self, originalSEL);
    Method swizzleMethod = class_getInstanceMethod(self, swizzleSEL);
    IMP swizzleIMP = method_getImplementation(swizzleMethod);
    const char *originalTypes = method_getTypeEncoding(originalMethod);
    
    BOOL addSwizzleResult = class_addMethod(self, originalSEL, swizzleIMP, originalTypes);
    if (addSwizzleResult == NO) {
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}


#pragma mark - Getter

- (DPWeakSet *)hookerSet {
    
    DPWeakSet *hookerSet = objc_getAssociatedObject(self, "_dp_swizlle_hookerSet");
    
    if (hookerSet == nil) {
        hookerSet = [[DPWeakSet alloc] init];
        objc_setAssociatedObject(self, "_dp_swizlle_hookerSet", hookerSet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return hookerSet;
}

@end
