//
//  CommunityCoordinator.m
//  CommunityModule
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "CommunityCoordinator.h"
#import "CommunityViewController.h"

@implementation CommunityCoordinator

- (void)start {
    CommunityViewController *communituVC = [CommunityViewController viewControllerWithNib];
    [self.navigationController pushViewController:communituVC animated:NO];
}

@end
