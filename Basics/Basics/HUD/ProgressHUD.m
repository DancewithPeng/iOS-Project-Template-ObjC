//
//  ProgressHUD.m
//  Basics
//
//  Created by DancewithPeng on 2017/12/30.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "ProgressHUD.h"
#import <objc/runtime.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface MBBackgroundView (AdjustEffectView)

- (void)adjustEffectView;

@end

@implementation MBBackgroundView (AdjustEffectView)

- (void)adjustEffectView {
    NSArray *subViews = self.subviews;
    for (UIView *v in subViews) {
        if ([v isKindOfClass:[UIVisualEffectView class]]) {
            [self sendSubviewToBack:v];
            break;
        }
    }
}

@end

@interface ProgressHUD ()

@end

@implementation ProgressHUD

#pragma mark - Interfaces

+ (void)show {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithFrame:keyWindow.bounds];
//    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    hud.bezelView.blurEffectStyle = UIBlurEffectStyleDark;
    [hud.bezelView adjustEffectView];
    hud.contentColor = [UIColor yellowColor];
    [keyWindow addSubview:hud];
    [hud showAnimated:YES];
    
    hud.label.text = @"拉拉拉拉...";
}

+ (void)dismiss {
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [MBProgressHUD hideHUDForView:keyWindow animated:YES];
}



@end
