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
  if ([response isSucceed]) {
    if ([LibraryInfo validateArrayData:response.data]) {
      [self.libraryInfos removeAllObjects];
      
      NSArray *libraryItem = response.data;
      for (NSDictionary *libraryInfoData in libraryItem) {
        if ([LibraryInfo validateDictionaryData:libraryInfoData]) {
          LibraryInfo *libraryInfo = [LibraryInfo libraryInfoWithData:libraryInfoData];
          [self.libraryInfos addObject:libraryInfo];
        } else {
          [self toast:@"数据结构错误"];
        }
      }
    } else {
      [self toast:@"数据结构错误"];
    }
  } else {
    NSLog(@"%@", response.errorMessage);
  }
  
  [self reloadDatas];
}

#pragma mark - Private Methods

- (void)requestLoadLibrary {
   NSString *bookName = [self.searchBar.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
  ApiRequest *request = [ApiRequest requestForLibrary:bookName];
  [[ApiService serviceWithDelegate:self] sendLibraryJSONRequest:request];
}

@end
