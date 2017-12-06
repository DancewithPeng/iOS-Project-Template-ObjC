//
//  LoginViewController.m
//  UserModule
//
//  Created by DancewithPeng on 2017/12/6.
//  Copyright © 2017年 dancewithpeng@gmail.com. All rights reserved.
//

#import "LoginViewController.h"
#import <Utilities/Utilities.h>

/** 当前 framework 对应的 bundle */
#define CurrentBundle [NSBundle bundleForClass:[self class]]
#define ImageForName(imageName) [UIImage imageNamed:imageName inBundle:CurrentBundle compatibleWithTraitCollection:nil]

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CurrentBundle;
    // [[UIViewController alloc] initWithNibName:@"1234" bundle:CurrentBundle];
    // [UIImage imageNamed:@"Name" inBundle:CurrentBundle compatibleWithTraitCollection:nil];
//    [UIStoryboard storyboardWithName:@"1234" bundle:CurrentBundle];
    self.imageView.image = UIImageNamed(@"ok");
    self.imageView.image = ImageForName(@"");
    self.navigationItem.title = @"登录";
//    self.imageView.image = [UIImage imageNamed:@"think"];
    
    
    
    self.imageView.image = UIImageNamed(@"think");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Demo" bundle:kDefaultBundle];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Hello"];
    [self.navigationController pushViewController:vc animated:YES];
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
