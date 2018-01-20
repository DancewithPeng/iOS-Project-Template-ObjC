//
//  DPRollBar.h
//  Utilities
//
//  Created by DancewithPeng on 2018/1/20.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPRollBarCell.h"

@class DPRollBar;
@protocol DPRollBarDataSource <NSObject>

- (NSInteger)numberOfItemsInRollBar:(DPRollBar *)rollBar;
- (DPRollBarCell *)rollBar:(DPRollBar *)rollBar cellForItemWithIndex:(NSInteger)index;

- (void)rollBar:(DPRollBar *)rollBar didSelectItemAtIndex:(NSInteger)index;

@end

@interface DPRollBar : UIView

@property (nonatomic, weak) id<DPRollBarDataSource> dataSource;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, assign) NSInteger rollingItems;
@property (nonatomic, assign) NSTimeInterval itemStayDuration;
@property (nonatomic, assign) NSTimeInterval itemRollingAnimationDuration;

- (void)startRoll;
- (void)stopRoll;

- (void)registerCalss:(Class)cls forCellWithReuseIdentifier:(NSString *)identifier;
- (DPRollBarCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

- (void)reloadData;

@end
