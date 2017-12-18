//
//  DynamicFontManager.m
//  Utilities
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "DynamicFontManager.h"
#import "DPWeakSet.h"

@interface DynamicFontManager ()

@property (nonatomic, strong) DPWeakSet *observers;

@end

@implementation DynamicFontManager

#pragma mark - Interfaces

+ (instancetype)defaultManager {
    static DynamicFontManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DynamicFontManager alloc] init];
    });
    
    return manager;
}

- (BOOL)containsObserver:(id<DynamicFontObserver>)observer {
    return [self.observers containsObject:observer];
}

- (void)addFontChangedObserver:(id<DynamicFontObserver>)observer {
    [self.observers addObject:observer];
}

- (void)removeFontChangedObserver:(id<DynamicFontObserver>)observer {
    [self.observers removeObject:observer];
}

- (void)updateFontSize:(CGFloat)fontSize forType:(DynamicFontType)type {
    [self.observers enumerateObjectsUsingBlock:^(id<DynamicFontObserver>  _Nonnull obj, BOOL * _Nonnull stop) {
        [obj dynamicFontManager:self sizeDidChanged:fontSize forType:type];
    }];
}
                  
#pragma mark - Getter
                  
- (DPWeakSet *)observers {
    if (_observers == nil) {
        _observers = [[DPWeakSet alloc] init];
    }

    return _observers;
}

@end
