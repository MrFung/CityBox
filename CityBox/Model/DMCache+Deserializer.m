//
//  DMCache+Deserializer.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "DMCache+Deserializer.h"
#import "NSDictionary+Utility.h"

@implementation DMCache (Deserializer)

#pragma mark - Public Methods

+ (BOOL)validateDictionaryData:(NSDictionary *)data {
  if (![data isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  
  return YES;
}

- (void)updateFromDictionaryData:(NSDictionary *)data {
  self.value = [data stringForKey:@"value"];
}

@end
