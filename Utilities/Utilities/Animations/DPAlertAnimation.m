//
//  DPAlertAnimation.m
//  Utilities
//
//  Created by DancewithPeng on 2018/1/18.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

#import "DPAlertAnimation.h"

@implementation DPAlertAnimation

@synthesize type = _type;

- (instancetype)init {
    return [self initWithType:DPAlertAnimationTypeShow];
}

- (instancetype)initWithType:(DPAlertAnimationType)type {
    if (self = [super init]) {
        _type = type;
    }
    
    return self;
}

+ (instancetype)animationWithType:(DPAlertAnimationType)type {
    return [[self alloc] initWithType:type];
}

// 转场时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25f;
}

// 转场过程
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 转场容器的View
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSLog(@"------%@", toViewController);
    NSLog(@"----------from - %@", fromViewController);
    

    switch (self.type) {
        case DPAlertAnimationTypeShow: {
            
            // 插入“to”视图，初始缩放值为0.0
//            toViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
            toViewController.view.alpha = 0.f;
//            [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
            
            [containerView addSubview:toViewController.view];
            
            //缩放“to”视图为想要的效果
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//                toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                toViewController.view.alpha = 1.f;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        } break;
        case DPAlertAnimationTypeDismiss: {
            
            // 插入“to”视图
            //[containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
//            [fromViewController.view removeFromSuperview];
            [containerView addSubview:toViewController.view];
            
            
            //缩小“from”视图，直到其消失
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//                fromViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
                toViewController.view.alpha = 0.f;
            } completion:^(BOOL finished) {
                [fromViewController.view removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        } break;
    }
}

@end
