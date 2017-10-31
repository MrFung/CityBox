//
//  LoginViewController.m
//  test
//
//  Created by 郭枫 on 2017/10/20.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewController+LogicFlow.h"
#import "LoginViewController+Configuration.h"
#import "CanteenViewController.h"
#import "Profile+DataManager.h"
#import "Profile+Utility.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

+ (instancetype)create {
  return [LoginViewController createWithStoryboardName:StoryboardNameLogin];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configureView];
  [self checkShowNextView];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self popGestureRecognizerDisable];
  [self updateKeyboardManagerWithPreviousNextHidden:NO];
  [self updateKeyboardManagerWithBottomHeight:100];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self updateKeyboardManagerWithPreviousNextHidden:YES];
  [self updateKeyboardManagerWithBottomHeight:16];
}

#pragma mark - IBAction Methods

- (IBAction)loginButtonClicked:(id)sender {
  [self login];
}

- (IBAction)viewTouchDown:(id)sender {
  [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - Public Methods

- (void)checkShowNextView {
  if ([[Profile current] isLogin]) {
    [BaseViewController resetTabThenSelectedHome];
  } else {
    [BaseViewController showLoginView];
  }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  return [textField resignFirstResponder];
}

#pragma mark - Privite Methods

- (void)showCanteenViewController {
  CanteenViewController *canteenViewController = [CanteenViewController create];
  [self.navigationController pushViewController:canteenViewController animated:YES];
}

@end
