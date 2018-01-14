//
//  MainCoordinator.m
//  DPApp
//
//  Created by 张鹏 on 2017/12/15.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "MainCoordinator.h"
#import "MainTabBarController.h"

#import <Utilities/UIViewController+ShowChildViewController.h>

#import <HomepageModule/HomepageCoordinator.h>
#import <ExploreModule/ExploreCoordinator.h>
#import <CommunityModule/CommunityCoordinator.h>
#import <UserModule/PersonalCoordinator.h>

@interface MainCoordinator ()

@end

@implementation MainCoordinator

- (void)startWithCompletion:(FlowCompletionHandler)completion {
    [super startWithCompletion:completion];
    
    [self showTabBarController];
}

- (void)showTabBarController {
    
    // 显示主页面
    MainTabBarController *tabBarController = [[MainTabBarController alloc] init];
    
    UINavigationController *homepageNav = [[UINavigationController alloc] init];
    homepageNav.tabBarItem.title = @"主页";
    
    UINavigationController *exploreNav = [[UINavigationController alloc] init];
    exploreNav.tabBarItem.title = @"发现";
    
    UINavigationController *communityNav = [[UINavigationController alloc] init];
    communityNav.tabBarItem.title = @"社区";
    
    UINavigationController *personalNav = [[UINavigationController alloc] init];
    personalNav.tabBarItem.title = @"个人";
    
    tabBarController.viewControllers = @[homepageNav, exploreNav, communityNav, personalNav];
    
    [self.baseViewController showChildViewController:tabBarController];
    
    HomepageCoordinator *homepageCoordinator = [[HomepageCoordinator alloc] initWithBaseViewController:homepageNav];
    ExploreCoordinator *exploreCoordinator = [[ExploreCoordinator alloc] initWithBaseViewController:exploreNav];
    CommunityCoordinator *communityCoordinator = [[CommunityCoordinator alloc] initWithBaseViewController:communityNav];
    PersonalCoordinator *personalCoordinator = [[PersonalCoordinator alloc] initWithBaseViewController:personalNav];
    
    [homepageCoordinator startWithCompletion:nil];
    [exploreCoordinator startWithCompletion:nil];
    [communityCoordinator startWithCompletion:nil];
    [personalCoordinator startWithCompletion:nil];
}

@end
