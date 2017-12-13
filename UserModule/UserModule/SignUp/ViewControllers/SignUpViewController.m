//
//  SignUpViewController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UILabel *supplementaryLabel;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)supplementaryBtnDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(supplementSignUpInformationWithCompletionHandler:)]) {
        [self.delegate supplementSignUpInformationWithCompletionHandler:^(BOOL isCancel, NSDictionary *info) {
            
        }];
    }
}

- (IBAction)signUpBtnClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(signUpWithUsername:password:completionHandler:)]) {
        [self.delegate signUpWithUsername:self.usernameTF.text password:self.passwordTF.text completionHandler:nil];
    }
}


#pragma mark - Setter

- (void)setSupplementary:(NSString *)supplementary {
    if (_supplementary != supplementary) {
        _supplementary = [supplementary copy];
        
        self.supplementaryLabel.text = supplementary;
    }
}


@end
