//
//  SignUpSupplementaryViewController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignUpSupplementaryViewController.h"
#import <Utilities/UIViewController+NavigationControllerSequence.h>

@interface SignUpSupplementaryViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SignUpSupplementaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"补充信息";
}

- (IBAction)doneBtnDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(supplementFinishedWithInfo:completionHandler:)]) {
        [self.delegate supplementFinishedWithInfo:@{@"Supplementary": self.textView.text} completionHandler:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
