//
//  SignInViewController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登陆";
    
    self.usernameTF.text = self.defaultUsername;
    self.passwordTF.text = self.defaultPassword;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInBtnDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(signInWithUsername:password:finished:)]) {
        [self.delegate signInWithUsername:@"Hello" password:@"World" finished:^(BOOL isSuccess, NSError *error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [self presentViewController:alert animated:YES completion:nil];
        }];
    }
}

- (IBAction)signUpBtnDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(signUp)]) {
        [self.delegate signUp];
    }
}

@end
