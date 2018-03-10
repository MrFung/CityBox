//
//  NewsInfo.m
//  CityBox
//
//  Created by 郭枫 on 2018/3/1.
//  Copyright © 2018年 郭枫. All rights reserved.
//

#import "NewsInfo.h"

@implementation NewsInfo

+ (instancetype)newsInfoWithData:(NSDictionary *)data {
  NewsInfo *newsInfo = [[NewsInfo alloc] init];
  
  newsInfo.title = [data stringForKey:@"title"];
  newsInfo.author = [data stringForKey:@"author_name"];
  newsInfo.time = [data stringForKey:@"date"];
  newsInfo.picture = [data stringForKey:@"thumbnail_pic_s"];
  newsInfo.url = [data stringForKey:@"url"];
  
  return newsInfo;
}

@end
