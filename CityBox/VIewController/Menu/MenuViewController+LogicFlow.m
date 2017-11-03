//
//  MenuViewController+LogicFlow.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "MenuViewController+LogicFlow.h"
#import "MenuInfo.h"

@implementation MenuViewController (LogicFlow)

#pragma mark - Public Methods

//- (void)loadData {
//  [self requestLoadCanteen];
//}

#pragma mark - ApiServiceDelegate

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
  switch (request.type) {
    case ApiRequestTypeCanteen:
      [self handleLoadCanteenResponse:response];
      break;
      
    default:
      break;
  }
}

- (void)handleLoadCanteenResponse:(ApiResponse *)response {
  if ([response isSucceed]) {
    if ([MenuInfo validateArrayData:response.data]) {
      [self.menuInfos removeAllObjects];
      
      NSArray *resultArray = response.data;
      for (NSDictionary *item in resultArray) {
        NSArray *tempArray = item[@"data"];
        for (NSDictionary *subItem in tempArray) {
          if ([MenuInfo validateDictionaryData:subItem]) {
            MenuInfo *menuInfo = [MenuInfo menuInfoWithData:subItem];
            [self.menuInfos addObject:menuInfo];
          } else {
            NSLog(@"数据结构错误");
          }
        }
      }
    } else {
      NSLog(@"数据结构错误");
    }
  } else {
    NSLog(@"%@", response.errorMessage);
  }
  
  [self reloadDatas];
}

#pragma mark - Private Methods

//- (void)requestLoadCanteen {
//  ApiRequest *request = [ApiRequest requestForMenu:<#(NSString *)#>];
//  [[ApiService serviceWithDelegate:self] sendCanteenJSONRequest:request];
//}

@end
