//
//  NSObject+Runtime.h
//  Utilities
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

@property (nonatomic, readonly) NSArray *propertyNames;

+ (BOOL)swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;


/**
 ```
 __block NSInvocation *invocation = nil;
 invocation = [self jr_swizzleMethod:@selector(initWithCoder:) withBlock:^(id obj, NSCoder *coder) {
 NSLog(@"before %@, coder %@", obj, coder);
 
 [invocation setArgument:&coder atIndex:2];
 [invocation invokeWithTarget:obj];
 
 id ret = nil;
 [invocation getReturnValue:&ret];
 
 NSLog(@"after %@, coder %@", obj, coder);
 
 return ret;
 } error:nil];
 ```
 */
+ (NSInvocation*)swizzleMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;

/**
 ```
 __block NSInvocation *classInvocation = nil;
 classInvocation = [self jr_swizzleClassMethod:@selector(test) withBlock:^() {
 NSLog(@"before");
 
 [classInvocation invoke];
 
 NSLog(@"after");
 } error:nil];
 ```
 */
+ (NSInvocation*)swizzleClassMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;

@end
