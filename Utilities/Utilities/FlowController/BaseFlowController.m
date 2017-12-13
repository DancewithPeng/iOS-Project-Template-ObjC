//
//  BaseFlowController.m
//  Utilities
//
//  Created by 张鹏 on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "BaseFlowController.h"

@interface BaseFlowController ()

/**
 子控制器
 */
@property (nonatomic, strong) NSMutableArray *privateChildControllers;

@end

@implementation BaseFlowController

@synthesize baseViewController = _baseViewController;

#pragma mark - Init

- (instancetype)initWithBaseViewController:(UIViewController *)baseViewController {
    if (self = [super init]) {
        _baseViewController = baseViewController;
    }
    
    return self;
}


#pragma mark - Interfaces

- (void)start {
    [NSException raise:@"BasicFlowController Exception" format:@"subclass must implement this method: %s",           __PRETTY_FUNCTION__];
}

- (NSArray<id<FlowController>> *)childControllers {
    return self.privateChildControllers;
}

- (void)addChildController:(id<FlowController>)childController {
    [self.privateChildControllers addObject:childController];
}

- (void)removeChildController:(id<FlowController>)childController {
    [self.privateChildControllers removeObject:childController];
}

- (UINavigationController *)navigationController {
    if ([self.baseViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)self.baseViewController;
    }
    
    return nil;
}

- (UITabBarController *)tabBarController {
    if ([self.baseViewController isKindOfClass:[UITabBarController class]]) {
        return (UITabBarController *)self.baseViewController;
    }
    
    return nil;
}


#pragma mark - Getter

- (NSMutableArray *)privateChildControllers {
    if (_privateChildControllers == nil) {
        _privateChildControllers = [[NSMutableArray alloc] init];
    }
    
    return _privateChildControllers;
}

@end
