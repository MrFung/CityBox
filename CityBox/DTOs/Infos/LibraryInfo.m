//
//  LibraryInfo.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/1.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LibraryInfo.h"
#import "NSDictionary+Utility.h"

@implementation LibraryInfo

+ (instancetype)libraryInfoWithData:(NSDictionary *)data {
  LibraryInfo *libraryInfo = [[LibraryInfo alloc] init];
  
  libraryInfo.bookId = [data stringForKey:@"id"];
  libraryInfo.bookNo = [data stringForKey:@"no"];
  libraryInfo.bookName = [data stringForKey:@"title"];
  libraryInfo.bookAuther = [data stringForKey:@"auther"];
  libraryInfo.bookPress = [data stringForKey:@"press"];
  libraryInfo.bookTime = [data stringForKey:@"time"];
  libraryInfo.bookSearch = [data stringForKey:@"search"];
  libraryInfo.bookPlace = [data stringForKey:@"place"];
  libraryInfo.bookStatus = [data stringForKey:@"state"];
  
  return libraryInfo;
}

@end
