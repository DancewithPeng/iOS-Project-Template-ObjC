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

- (void)start {
    HomepageViewController *homepageVC = [HomepageViewController viewControllerWithNib];    
    [self.navigationController pushViewController:homepageVC animated:NO];
}

@end
