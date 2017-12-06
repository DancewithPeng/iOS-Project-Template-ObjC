//
//  UIViewController+FrameworkNib.m
//  Utilities
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "UIViewController+FrameworkNib.h"

@implementation UIViewController (FrameworkNib)

+ (instancetype)viewControllerWithNib {
    NSString *nibName = NSStringFromClass(self);
    return [self viewControllerWithNibName:nibName];
}

+ (instancetype)viewControllerWithNibName:(NSString *)nibName {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    return [self viewControllerWithNibName:nibName inBundle:bundle];
}


+ (instancetype)viewControllerWithNibName:(NSString *)nibName inBundle:(NSBundle *)bundle {
    return [[self alloc] initWithNibName:nibName bundle:bundle];
}

- (instancetype)initWithNib {
    NSString *nibName = NSStringFromClass([self class]);
    if (self = [self initWithNibName:nibName]) {
        
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    if (self = [self initWithNibName:nibNameOrNil bundle:currentBundle]) {
        
    }
    return self;
}

@end
