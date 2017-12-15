//
//  FlowCoordinator.h
//  Utilities
//
//  Created by DancewithPeng on 2017/12/14.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 流程协调器
 这是一个接口，规定了流程协调器必须实现的方法
 */
@protocol FlowCoordinator <NSObject>

/**
 子协调器
 */
@property (nonatomic, readonly) NSArray<id<FlowCoordinator>> *childCoordinators;


/**
 流程开始
 */
- (void)start;


/**
 添加子协调器
 
 @param childCoordinator 子协调器
 */
- (void)addChildCoordinator:(id<FlowCoordinator>)childCoordinator;

/**
 移除子协调器
 
 @param childCoordinator 子协调器
 */
- (void)removeChildCoordinator:(id<FlowCoordinator>)childCoordinator;

@end
