//
//  ProfileInfo.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ProfileInfo.h"

@implementation ProfileInfo

+ (instancetype)profileInfoWithData:(NSDictionary *)data {
  ProfileInfo *profileInfo = [[ProfileInfo alloc] init];
  
  profileInfo.title = [data stringForKey:@"title"];
  
  return profileInfo;
}

@end
