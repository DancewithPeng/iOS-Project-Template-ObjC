//
//  SignInViewController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/13.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "SignInViewController.h"
#import <Basics/ProgressHUD.h>

@interface MyLabel : UILabel
@end

@implementation MyLabel

- (void)dealloc {
    NSLog(@"👻👻👻 - %p", self);
}

@end

@interface UILabel (test)


@end

@implementation UILabel (test)

//- (void)dealloc {
//    NSLog(@"😂😂😂 - %p", self);
//}

@end

@interface SignInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation SignInViewController


#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登陆";
    
    MyLabel *aLabel = [[MyLabel alloc] initWithFrame:CGRectMake(0, 80, 320, 60)];
    aLabel.font = [UIFont systemFontOfSize:30];
    aLabel.text = @"Hello World! kdkdkdkdkd";
    aLabel.dynamic = YES;
    [self.view addSubview:aLabel];
    
    MyLabel *aLabel2 = [[MyLabel alloc] initWithFrame:CGRectMake(0, 150, 320, 60)];
    aLabel2.font = [UIFont systemFontOfSize:30];
    aLabel2.text = @"Hello World! kdkdkdkdkd";
    aLabel2.dynamic = YES;
    [self.view addSubview:aLabel2];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.usernameTF.text = self.defaultUsername;
    self.passwordTF.text = self.defaultPassword;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGFloat newSize = arc4random() % 50 + 30;
    [[DynamicFontManager defaultManager] updateFontSize:newSize forType:nil];
}


- (IBAction)signInBtnDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(signInWithUsername:password:finished:)]) {
        
        [ProgressHUD show];
        
        [self.delegate signInWithUsername:self.usernameTF.text password:self.passwordTF.text finished:^(BOOL isSuccess, NSError *error) {
        
            [ProgressHUD dismiss];
            
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
//
//            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//            }]];
            
//            [self presentViewController:alert animated:YES completion:nil];
        }];
    }
}

- (IBAction)signUpBtnDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(signUp)]) {
        [self.delegate signUp];
    }
}

- (void)dealloc {
    NSLog(@"好吧吧吧");
}

@end
