//
//  FlowController.h
//  Utilities
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 流程控制器
 这是一个接口，规定了流程控制器必须实现的方法
 */
@protocol FlowController <NSObject>

/**
 子控制器
 */
@property (nonatomic, readonly) NSArray<id<FlowController>> *childControllers;


/**
 流程开始
 */
- (void)start;


/**
 添加子控制器

 @param childController 子控制器
 */
- (void)addChildController:(id<FlowController>)childController;

/**
 移除子控制器

 @param childController 子控制器
 */
- (void)removeChildController:(id<FlowController>)childController;

@end
