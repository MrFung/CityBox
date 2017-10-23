//
//  LoginViewController.m
//  test
//
//  Created by 郭枫 on 2017/10/20.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - IBAction Methods

- (IBAction)loginButtonClicked:(id)sender {
  [self showHomeViewController];
}

#pragma mark - Privite Methods

- (void)showHomeViewController {
  HomeViewController *homeViewController = [HomeViewController create];
  [self.navigationController pushViewController:homeViewController animated:YES];
}

@end
