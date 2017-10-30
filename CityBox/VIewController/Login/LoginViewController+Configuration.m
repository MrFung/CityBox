//
//  LoginViewController+Configuration.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController+Configuration.h"

@implementation LoginViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
}

- (void)configureView {
  [self configureDelegate];
}

#pragma mark - Private Methods

- (void)configureDelegate {
  self.userNameTextField.delegate = self;
  self.passWordTextField.delegate = self;
}

@end
