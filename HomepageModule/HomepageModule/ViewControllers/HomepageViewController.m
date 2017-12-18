//
//  HomepageViewController.m
//  HomepageModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "HomepageViewController.h"
#import <Utilities/UILabel+DynamicFont.h>

@interface HomepageViewController ()

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    testLabel.font = [UIFont systemFontOfSize:100];
    testLabel.numberOfLines = 0;
    testLabel.text = @"哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 ";
//    testLabel.dynamic = YES;
    [self.view addSubview:testLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
