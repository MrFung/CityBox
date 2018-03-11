//
//  CanteenViewController+LogicFlow.m
//  test
//
//  Created by 郭枫 on 2017/9/29.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CanteenViewController+LogicFlow.h"
#import "ApiResponse.h"
#import "CanteenInfo.h"

@implementation CanteenViewController (LogicFlow)

#pragma mark - Public Methods

- (void)loadData {
  [self requestLoadCanteen];
}

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
    if ([CanteenInfo validateArrayData:response.data]) {
      [self.canteenInfos removeAllObjects];
      
      NSArray *resultArray = response.data;
      for (NSDictionary *item in resultArray) {
        NSArray *tempArray = item[@"data"];
        for (NSDictionary *subItem in tempArray) {
          if ([CanteenInfo validateDictionaryData:subItem]) {
            CanteenInfo *canteenInfo = [CanteenInfo canteenInfoWithData:subItem];
            [self.canteenInfos addObject:canteenInfo];
          } else {
            NSLog(@"数据结构错误");
          }
        }
      }
      
       [self reloadDatas];
      
    } else {
      NSLog(@"数据结构错误");
    }
  } else {
    NSLog(@"%@", response.errorMessage);
  }
  
  [self stopRefresh];
}

#pragma mark - Private Methods

- (void)requestLoadCanteen {
  ApiRequest *request = [ApiRequest requestForCanteen];
  [[ApiService serviceWithDelegate:self] sendCanteenJSONRequest:request];
}


@end
