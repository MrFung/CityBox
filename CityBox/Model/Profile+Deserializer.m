//
//  CoreDataClass+Deserializer.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "Profile+Deserializer.h"
#import "NSDictionary+Utility.h"

@implementation Profile (Deserializer)

- (void)updateFromDictionaryData:(NSDictionary *)data {
  NSString *userName = [data stringForKey:@"username"];
  if (userName.length > 0) {
    self.userName = userName;
  }
  
  NSString *passWord = [data stringForKey:@"password"];
  self.passWord = passWord;
}

@end
