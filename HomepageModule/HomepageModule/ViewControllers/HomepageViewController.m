//
//  HomepageViewController.m
//  HomepageModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "HomepageViewController.h"
#import <Utilities/UILabel+DynamicFont.h>
#import <Utilities/DPRollBar.h>

@interface HomepageViewController () <DPRollBarDataSource>

@property (nonatomic, strong) DPRollBar *rollBar;

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    
//    UILabel *testLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
//    testLabel.font = [UIFont systemFontOfSize:100];
//    testLabel.numberOfLines = 0;
//    testLabel.text = @"哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 哈哈哈哈 😂😂😂😂 ";
//    testLabel.dynamic = YES;
    
    DPRollBar *rollBar = [[DPRollBar alloc] initWithFrame:CGRectMake(10, 100, 300, 44.f)];
    rollBar.dataSource = self;
    rollBar.itemHeight = 20.f;
    rollBar.itemSpacing = 2.f;
    [self.view addSubview:rollBar];
    [rollBar registerCalss:[DPRollBarCell class] forCellWithReuseIdentifier:@"kkkk"];
    self.rollBar = rollBar;
//    [self.view addSubview:testLabel];
}

- (NSInteger)numberOfItemsInRollBar:(DPRollBar *)rollBar {
    return 3;
}

- (DPRollBarCell *)rollBar:(DPRollBar *)rollBar cellForItemWithIndex:(NSInteger)index {
    
    NSLog(@".....%ld", index);
    
    DPRollBarCell *cell = [rollBar dequeueReusableCellWithIdentifier:@"kkkk"];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1.0f];
    return cell;
}

- (void)rollBar:(DPRollBar *)rollBar didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"------%ld", index);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.rollBar startRoll];
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
