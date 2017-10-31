//
//  LoginViewController+LogicFlow.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController+LogicFlow.h"
#import "ApiResponse+DataExtractor.h"
#import "Profile+DataManager.h"
#import "DMCache+DataManager.h"
#import "Profile+Utility.h"
#import "NSDictionary+Utility.h"

NSString *const userNameIdentifier = @"userNameIdentifier";

@implementation LoginViewController (LogicFlow)

#pragma mark - Public Methods

- (void)login {
  [self requestLogin];
}

#pragma mark - ApiServiceDelegate

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
  switch (request.type) {
    case ApiRequestTypeLogin:
      [self handleLoginResponse:response];
      break;
      
    default:
      break;
  }
}

- (void)handleLoginResponse:(ApiResponse *)response {
  if ([response isSucceed]) {
    if ([[response.data stringForKey:@"status"] isEqualToString:@"ok"]) {
      [self saveProfileDataWithResponse:response];
    } else {
      [self toast:@"学号或密码错误"];
    }
  } else {
    [self toast:@"网络连接错误"];
  }
}

#pragma mark - Private Methods

- (void)requestLogin {
  ApiRequest *request = [ApiRequest requestForLogin:self.userNameTextField.text password:self.passWordTextField.text];
  [[ApiService serviceWithDelegate:self] sendLoginJSONRequest:request];
}

- (void)saveProfileDataWithResponse:(ApiResponse *)response {
  [Profile createOrUpdateFromDictionaryData:@{@"username": self.userNameTextField.text, @"password" : self.passWordTextField.text, @"studentName" : [response.data stringForKey:@"man"]} completion:^(BOOL success, NSError *error) {
    [DMCache createOrUpdateByDictionaryData:@{@"value" : self.userNameTextField.text} key:userNameIdentifier completion:^(BOOL success, NSError *error) {
      [self dismissViewControllerAnimated:YES completion:nil];
      [BaseViewController resetTabThenSelectedHome];
    }];
  }];
}

@end
