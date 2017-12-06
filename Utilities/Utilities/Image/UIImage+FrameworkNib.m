//
//  UIImage+FrameworkNib.m
//  Utilities
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "UIImage+FrameworkNib.h"

@implementation UIImage (FrameworkNib)

+ (instancetype)imageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle {
    return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
}

+ (instancetype)imageNamed:(NSString *)imageName inClass:(Class)cls {
    NSBundle *bundle = [NSBundle bundleForClass:cls];
    return [self imageNamed:imageName inBundle:bundle];
}

+ (instancetype)imageNamed:(NSString *)imageName inObject:(id)obj {
    NSBundle *bundle = [NSBundle bundleForClass:[obj class]];
    return [self imageNamed:imageName inBundle:bundle];
}

@end
