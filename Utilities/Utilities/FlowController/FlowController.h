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

@property (nonatomic, readonly) NSArray<FlowController> *childControllers;

- (void)start;
- (void)addChildController:(id<FlowController>)childController;

@end
