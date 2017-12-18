//
//  DynamicFontManager.h
//  Utilities
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString * DynamicFontType;

@class DynamicFontManager;
@protocol DynamicFontObserver <NSObject>

- (void)dynamicFontManager:(DynamicFontManager *)fontManager sizeDidChanged:(CGFloat)fontSize forType:(DynamicFontType)type;

@end

@interface DynamicFontManager : NSObject

+ (instancetype)defaultManager;

- (BOOL)containsObserver:(id<DynamicFontObserver>)observer;
- (void)addFontChangedObserver:(id<DynamicFontObserver>)observer;
- (void)removeFontChangedObserver:(id<DynamicFontObserver>)observer;

- (void)updateFontSize:(CGFloat)fontSize forType:(DynamicFontType)type;

@end
