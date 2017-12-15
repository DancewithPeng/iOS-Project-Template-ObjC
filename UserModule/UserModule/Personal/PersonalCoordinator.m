//
//  PersonalCoordinator.m
//  UserModule
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "PersonalCoordinator.h"
#import "PersonalViewController.h"

@implementation PersonalCoordinator

- (void)start {
    PersonalViewController *personalVC = [PersonalViewController viewControllerWithNib];
    [self.navigationController pushViewController:personalVC animated:NO];
}

@end
