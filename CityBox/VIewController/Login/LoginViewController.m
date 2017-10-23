//
//  LoginViewController.m
//  test
//
//  Created by 郭枫 on 2017/10/20.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewController+LogicFlow.h"
#import "CanteenViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

+ (instancetype)create {
  return [LoginViewController createWithStoryboardName:StoryboardNameLogin];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
//  [self login];
}

#pragma mark - IBAction Methods

- (IBAction)loginButtonClicked:(id)sender {
  [BaseViewController resetTabThenSelectedHome];
  [self login];
}

#pragma mark - Privite Methods

- (void)showCanteenViewController {
  CanteenViewController *canteenViewController = [CanteenViewController create];
  [self.navigationController pushViewController:canteenViewController animated:YES];
}

@end
