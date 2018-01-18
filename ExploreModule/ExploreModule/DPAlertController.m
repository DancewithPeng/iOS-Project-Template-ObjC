//
//  DPAlertController.m
//  ExploreModule
//
//  Created by DancewithPeng on 2018/1/19.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

#import "DPAlertController.h"

@interface DPAlertController () <UIViewControllerTransitioningDelegate>


@end

@implementation DPAlertController

//- (instancetype)init {
//    if (self = [super init]) {
//        self.modalPresentationStyle = UIModalPresentationCustom;
////        self.transitioningDelegate = self;
//    }
//    return self;
//}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithWhite:100/255.f alpha:0.3];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
