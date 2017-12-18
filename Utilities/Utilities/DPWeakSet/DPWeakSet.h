//
//  DPWeakSet.h
//  Utilities
//
//  Created by 张鹏 on 2017/12/17.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPWeakSet : NSObject

@property (nonatomic, assign) NSInteger count;

- (void)addObject:(id _Nullable)object;
- (void)removeObject:(id _Nullable)object;
- (BOOL)containsObject:(id _Nullable)object;

- (void)enumerateObjectsUsingBlock:(void (^_Nonnull)(id _Nonnull obj, BOOL * _Nonnull stop))block;

@end
