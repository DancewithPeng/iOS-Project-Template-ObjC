//
//  ExploreCoordinator.m
//  ExploreModule
//
//  Created by 张鹏 on 2017/12/16.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "ExploreCoordinator.h"
#import "ExploreViewController.h"

@implementation ExploreCoordinator

- (void)start {
    ExploreViewController *exploreVC = [ExploreViewController viewControllerWithNib];
    [self.navigationController pushViewController:exploreVC animated:NO];
}

@end
