//
//  GroupInfo.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "GroupInfo.h"

@implementation GroupInfo

+ (BOOL)validateDictionaryData:(NSDictionary *)data {
  if (![data isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  return YES;
}

+ (instancetype)create {
  GroupInfo *groupInfo = [[GroupInfo alloc] init];
  groupInfo.profileInfos = [NSMutableArray array];
  
  return groupInfo;
}

+ (instancetype)groupInfoWithData:(NSDictionary *)data {
  GroupInfo *groupInfo = [GroupInfo create];
  NSArray *profileDatas = [data arrayForKey:@"profileInfos"];
  
  for (NSDictionary *profileData in profileDatas) {
    if ([self validateDictionaryData:profileData]) {
      ProfileInfo *profileInfo = [ProfileInfo profileInfoWithData:profileData];
      [groupInfo.profileInfos addObject:profileInfo];
    }
  }
  
  return groupInfo;
}

@end
