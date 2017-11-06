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

- (void)loadData {
  [self requestLoadMenu];
}

#pragma mark - ApiServiceDelegate

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
  switch (request.type) {
    case ApiRequestTypeMenu:
      [self handleLoadMenuResponse:response];
      break;
      
    default:
      break;
  }
}

- (void)handleLoadMenuResponse:(ApiResponse *)response {
  if ([response isSucceed]) {
    if ([MenuInfo validateArrayData:response.data]) {
      [self.menuInfos removeAllObjects];
      
      NSArray *menuItem = response.data;
      for (NSDictionary *menuInfoData in menuItem) {
        if ([MenuInfo validateDictionaryData:menuInfoData]) {
          MenuInfo *menuInfo = [MenuInfo menuInfoWithData:menuInfoData];
          [self.menuInfos addObject:menuInfo];
          } else {
            NSLog(@"数据结构错误");
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

- (void)requestLoadMenu {
  NSString *str = [NSString stringWithFormat:@"%ld", (long)self.menuId];
  NSString *menuId = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
  ApiRequest *request = [ApiRequest requestForMenu:menuId];
  [[ApiService serviceWithDelegate:self] sendMenuJSONRequest:request];
}

@end
