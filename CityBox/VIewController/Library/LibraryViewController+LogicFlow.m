//
//  LibraryViewController+LogicFlow.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/1.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LibraryViewController+LogicFlow.h"
#import "LibraryInfo.h"

@implementation LibraryViewController (LogicFlow)

#pragma mark - Public Methods

- (void)loadData {
  [self requestLoadLibrary];
}

#pragma mark - ApiServiceDelegate

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
  switch (request.type) {
    case ApiRequestTypeLibrary:
      [self handleLoadLibraryResponse:response];
      break;
      
    default:
      break;
  }
}

- (void)handleLoadLibraryResponse:(ApiResponse *)response {
  NSLog(@"<<<<<<%@", response.data);
  if ([response isSucceed]) {
    if ([LibraryInfo validateDictionaryData:response.data]) {
      [self.libraryInfos removeAllObjects];
      
      
    }
  } else {
    NSLog(@"%@", response.errorMessage);
  }
  
  [self reloadDatas];
}

#pragma mark - Private Methods

- (void)requestLoadLibrary {
  ApiRequest *request = [ApiRequest requestForLibrary:self.searchBar.text];
  [[ApiService serviceWithDelegate:self] sendLibraryJSONRequest:request];
}

@end
