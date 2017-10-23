//
//  CanteenInfo.m
//  test
//
//  Created by 郭枫 on 2017/9/29.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CanteenInfo.h"

@implementation CanteenInfo

+ (instancetype)canteenInfoWithData:(NSDictionary *)data {
  CanteenInfo *canteenInfo = [[CanteenInfo alloc] init];
  
  canteenInfo.menuId = [data stringForKey:@"id"];
  canteenInfo.location = [data stringForKey:@"location"];
  canteenInfo.floor = [data stringForKey:@"floor"];
  canteenInfo.name = [data stringForKey:@"name"];
  canteenInfo.telephone = [data stringForKey:@"telephone"];
  
  return canteenInfo;
}

@end
