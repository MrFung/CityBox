//
//  NewsViewController+LogicFlow.m
//  CityBox
//
//  Created by 郭枫 on 2018/3/1.
//  Copyright © 2018年 郭枫. All rights reserved.
//

#import "NewsViewController+LogicFlow.h"
#import "NewsInfo.h"

@implementation NewsViewController (LogicFlow)

- (void)loadData {
  [self requestLoadNews];
}

#pragma mark - ApiServiceDelegate

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
  switch (request.type) {
    case ApiRequestTypeNews:
      [self handleLoadNewsResponse:response];
      break;
      
    default:
      break;
  }
}

- (void)handleLoadNewsResponse:(ApiResponse *)response {
  if ([response isSucceed]) {
    NSLog(@"数据%@",response.data);
    if ([NewsInfo validateDictionaryData:response.data]) {
      [self.newsInfos removeAllObjects];

      NSArray *newsItem = response.data[@"data"];
      for (NSDictionary *newsInfoData in newsItem) {
        if ([NewsInfo validateDictionaryData:newsInfoData]) {
          NewsInfo *newsInfo = [NewsInfo newsInfoWithData:newsInfoData];
          [self.newsInfos addObject:newsInfo];
        } else {
          [self toast:@"数据结构错误"];
        }
      }
      
      [self reloadDatas];
      
    } else {
      [self toast:@"数据结构错误"];
    }
  } else {
    NSLog(@"%@", response.errorMessage);
  }

  [self stopRefresh];
}

#pragma mark - Private Methods

- (void)requestLoadNews {
  ApiRequest *request = [ApiRequest requestForNews];
  [[ApiService serviceWithDelegate:self] sendNewsJSONRequest:request];
}

@end
