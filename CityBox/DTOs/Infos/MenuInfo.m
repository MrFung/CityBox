//
//  MenuInfo.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "MenuInfo.h"

@implementation MenuInfo

+ (instancetype)menuInfoWithData:(NSDictionary *)data {
  MenuInfo *menuInfo = [[MenuInfo alloc] init];
  
  menuInfo.menuId = [data stringForKey:@"id"];
  menuInfo.foodName = [data stringForKey:@"name"];
  menuInfo.foodPrice = [data stringForKey:@"price"];
  
  return menuInfo;
}

@end
