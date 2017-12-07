//
//  UIImage+FrameworkNib.h
//  Utilities
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultBundle [NSBundle bundleForClass:[self class]]
#define UIImageNamed(imageName) [UIImage imageNamed:imageName inBundle:kDefaultBundle compatibleWithTraitCollection:nil]

@interface UIImage (FrameworkNib)

//+ (instancetype)imageInDefaultBundleNamed:(NSString *)imageName;
+ (instancetype)imageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle;
+ (instancetype)imageNamed:(NSString *)imageName inClass:(Class)cls;
+ (instancetype)imageNamed:(NSString *)imageName inObject:(id)obj;


@end
