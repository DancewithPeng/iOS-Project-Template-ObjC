//
//  UILabel+DynamicFont.h
//  Utilities
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicFontManager.h"

@interface UILabel (DynamicFont) <DynamicFontObserver>

@property (nonatomic, assign) BOOL dynamic;

@end
