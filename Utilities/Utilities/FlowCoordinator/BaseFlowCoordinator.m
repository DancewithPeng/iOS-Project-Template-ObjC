//
//  BaseFlowCoordinator.m
//  Utilities
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "BaseFlowCoordinator.h"

@interface BaseFlowCoordinator ()

/**
子协调
*/
@property (nonatomic, strong) NSMutableArray *privateChildCoordinators;


@end

@implementation BaseFlowCoordinator

@synthesize baseViewController = _baseViewController;

#pragma mark - Init

- (instancetype)initWithBaseViewController:(UIViewController *)baseViewController {
    if (self = [super init]) {
        _baseViewController = baseViewController;
    }
    
    return self;
}


#pragma mark - Interfaces

- (void)startWithCompletion:(FlowCompletionHandler)completion {
    self.completion = completion;
}

- (void)cancelWithError:(NSError *)error {
    if (self.completion != nil) {
        self.completion(NO, nil, error);
        self.completion = nil;
    }
}

- (void)finishWithInfo:(id)userInfo {
    if (self.completion != nil) {
        self.completion(YES, userInfo, nil);
        self.completion = nil;
    }
}

- (NSArray<id<FlowCoordinator>> *)childCoordinators {
    return self.privateChildCoordinators;
}

- (void)addChildCoordinator:(id<FlowCoordinator>)childCoordinator {
    [self.privateChildCoordinators addObject:childCoordinator];
}

- (void)removeChildCoordinator:(id<FlowCoordinator>)childCoordinator {
    [self.privateChildCoordinators removeObject:childCoordinator];
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

- (NSMutableArray *)privateChildCoordinators {
    if (_privateChildCoordinators == nil) {
        _privateChildCoordinators = [[NSMutableArray alloc] init];
    }
    
    return _privateChildCoordinators;
}

@end
