//
//  UILabel+DynamicFont.m
//  Utilities
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "UILabel+DynamicFont.h"

@implementation UILabel (DynamicFont)

- (BOOL)dynamic {
    return [[DynamicFontManager defaultManager] containsObserver:self];
}

- (void)setDynamic:(BOOL)dynamic {
    if (dynamic==YES && [[DynamicFontManager defaultManager] containsObserver:self]==NO) {        
        [[DynamicFontManager defaultManager] addFontChangedObserver:self];
    } else if (dynamic==NO && [[DynamicFontManager defaultManager] containsObserver:self]==YES) {
        [[DynamicFontManager defaultManager] removeFontChangedObserver:self];
    }
}

// 字体动态改变
- (void)dynamicFontManager:(DynamicFontManager *)fontManager sizeDidChanged:(CGFloat)fontSize forType:(DynamicFontType)type {
    UIFont *newFont = [UIFont fontWithName:self.font.familyName size:fontSize];
    self.font = newFont;
}

@end
