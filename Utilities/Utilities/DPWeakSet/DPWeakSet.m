//
//  DPWeakSet.m
//  Utilities
//
//  Created by 张鹏 on 2017/12/17.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "DPWeakSet.h"

@interface DPWeakSetElement : NSObject

@property (nonatomic, weak) id weakObject;
@property (nonatomic, assign) NSUInteger compareHash;

+ (instancetype)elementWithObject:(id)object;

- (NSString *)description;
- (NSString *)debugDescription;

@end

@implementation DPWeakSetElement

+ (instancetype)elementWithObject:(id)object {
    DPWeakSetElement *element = [[DPWeakSetElement alloc] init];
    element.weakObject = object;
    element.compareHash = [object hash];
    return element;
}

//- (BOOL)isEqual:(id)object {
//    return [self hash] == [object hash];
//}
//
//- (NSUInteger)hash {
//    return self.compareHash;
//}

- (NSString *)description {
    return [self.weakObject description];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@: %p, weakObject: <%@: %p>>", NSStringFromClass([self class]), self, NSStringFromClass([self.weakObject class]), self.weakObject];
}

@end

@interface DPWeakSet ()

@property (nonatomic, strong) NSMutableSet<DPWeakSetElement *> *strongSet;

@end

@implementation DPWeakSet

#pragma mark - Interfaces

- (void)addObject:(id)object {
    DPWeakSetElement *element = [[DPWeakSetElement alloc] init];
    element.weakObject = object;
    element.compareHash = [object hash];
    [self.strongSet addObject:element];
}

- (void)removeObject:(id)object {
    [self.strongSet removeObject:object];
}

- (BOOL)containsObject:(id)object {
    return [self.strongSet containsObject:object];
}

- (void)enumerateObjectsUsingBlock:(void (^)(id _Nonnull, BOOL * _Nonnull))block {
    [self removeNilElements];
    NSLog(@"%ld", self.strongSet.count);
    [self.strongSet enumerateObjectsUsingBlock:^(DPWeakSetElement * _Nonnull obj, BOOL * _Nonnull stop) {
        block(obj.weakObject, stop);
    }];
}

#pragma mark - Helper Methods

- (void)removeNilElements {
    
    // 移除weakObject已经销毁的Element
    NSMutableArray *shouldRemoveElements = [[NSMutableArray alloc] init];
    for (DPWeakSetElement *e in self.strongSet) {
        if (e.weakObject == nil) {
            [shouldRemoveElements addObject:e];
        }
    }
    
    for (DPWeakSetElement *e in shouldRemoveElements) {
        [self.strongSet removeObject:e];
    }
}

#pragma mark - Getter

- (NSInteger)count {
    return self.strongSet.count;
}

- (NSString *)description {
    return self.strongSet.description;
}

- (NSMutableSet<DPWeakSetElement *> *)strongSet {
    if (_strongSet == nil) {
        _strongSet = [[NSMutableSet alloc] init];
    }
    
    return _strongSet;
}

@end
