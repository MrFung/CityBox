//
//  LoginViewController+LogicFlow.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LoginViewController+LogicFlow.h"

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
  ApiRequest *request = [ApiRequest requestForLogin:@"201412050" password:@"199512"];
  [[ApiService serviceWithDelegate:self] sendJSONRequest:request];
}

@end
