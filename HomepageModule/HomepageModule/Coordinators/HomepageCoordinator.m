//
//  HomepageCoordinator.m
//  HomepageModule
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "HomepageCoordinator.h"
#import "HomepageViewController.h"

#import <Utilities/UIImage+FrameworkNib.h>

@implementation HomepageCoordinator

- (void)startWithCompletion:(FlowCompletionHandler)completion {
    [super startWithCompletion:completion];
    
    HomepageViewController *homepageVC = [HomepageViewController viewControllerWithNib];
    [homepageVC addHooker:self];
    [self.navigationController pushViewController:homepageVC animated:NO];
}


#pragma mark - UIViewControllerLifeCycleHooker

- (void)viewControllerViewDidLoad:(UIViewController *)viewController {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, viewController);
}

- (void)viewController:(UIViewController *)viewController viewWillAppear:(BOOL)animated {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__,  viewController);
}

- (void)viewController:(UIViewController *)viewController viewDidAppear:(BOOL)animated {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__,  viewController);
}

- (void)viewController:(UIViewController *)viewController viewWillDisappear:(BOOL)animated {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__,  viewController);
}

- (void)viewController:(UIViewController *)viewController viewDidDisappear:(BOOL)animated {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__,  viewController);
}

- (void)viewControllerDealloc:(UIViewController *)viewController {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__,  viewController);
}


@end
