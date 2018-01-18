//
//  ExploreViewController.m
//  ExploreModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "ExploreViewController.h"
#import "DPAlertController.h"
#import "TransitionController.h"

@interface ExploreViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发现";
    NSLog(@"%s", __PRETTY_FUNCTION__);
//    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)btnDidClicked:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    DPAlertController *alertController = [[DPAlertController alloc] init];
    alertController.modalPresentationStyle = UIModalPresentationCustom;
    alertController.transitioningDelegate = self;
    [self presentViewController:alertController animated:YES completion:nil];
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"哈哈哈" message:@"你啊好哦" preferredStyle:UIAlertControllerStyleAlert];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//    }]];
//
//    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    TransitionController *controller = [[TransitionController alloc] init];
    controller.isPresenting = YES;
    return controller;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TransitionController *controller = [[TransitionController alloc] init];
    controller.isPresenting = NO;
    return controller;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
