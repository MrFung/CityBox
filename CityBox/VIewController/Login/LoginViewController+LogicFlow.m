//
//  LoginViewController+LogicFlow.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController+LogicFlow.h"
#import "ApiResponse+DataExtractor.h"
#import "CoreDataClass+DataManager.h"
#import "DMCache+DataManager.h"

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
}

#pragma mark - Private Methods

- (void)requestLogin {
  ApiRequest *request = [ApiRequest requestForLogin:self.userNameTextField.text password:self.passWordTextField.text];
  [[ApiService serviceWithDelegate:self] sendJSONRequest:request];
}

- (void)saveProfileDataWithResponse:(ApiResponse *)response {
  [CoreDataClass createOrUpdateFromDictionaryData:@{@"username": [response userName], @"password" : [response passWord]} completion:^(BOOL success, NSError *error) {
    [DMCache createOrUpdateByDictionaryData:@{@"value" : self.userNameTextField.text} key:userNameIdentifier completion:^(BOOL success, NSError *error) {
      [self dismissViewControllerAnimated:YES completion:nil];
      [BaseViewController resetTabThenSelectedHome];
    }];
  }];
}

@end
