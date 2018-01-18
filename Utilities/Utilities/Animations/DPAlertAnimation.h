//
//  DPAlertAnimation.h
//  Utilities
//
//  Created by DancewithPeng on 2018/1/18.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DPAlertAnimationType) {
    DPAlertAnimationTypeShow,
    DPAlertAnimationTypeDismiss,
};

@interface DPAlertAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) DPAlertAnimationType type;

+ (instancetype)animationWithType:(DPAlertAnimationType)type;
- (instancetype)initWithType:(DPAlertAnimationType)type;

@end
