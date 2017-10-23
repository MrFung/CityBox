//
//  NSDictionary+Utility.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "NSDictionary+Utility.h"

@implementation NSDictionary (Utility)

- (NSData *)toJSONData {
  NSError *parseError = nil;
  
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&parseError];
  
  return jsonData;
}

- (NSNumber *)integerForKey:(NSString *)key {
  return [self integerForKey:key defaultValue:nil];
}

- (NSNumber *)integerForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue {
  id value = [self valueForKey:key];
  if ([NSNull null] == value) {
    return defaultValue;
  }
  return [NSNumber numberWithInteger:[value integerValue]];
}

- (NSString *)stringForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if (!value || [NSNull null] == value) {
    return @"";
  }
  if ([value isKindOfClass:[NSNumber class]]) {
    return [value stringValue];
  }
  if (![value isKindOfClass:[NSString class]]) {
    return @"";
  }
  if ([@"null" isEqualToString:value]) {
    return @"";
  }
  return value;
}

- (NSArray *)arrayForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if (!value || [NSNull null] == value) {
    return [NSArray array];
  }
  if (![value isKindOfClass:[NSArray class]]) {
    return [NSArray array];
  }
  return value;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if (!value || [NSNull null] == value) {
    return [NSDictionary dictionary];
  }
  if (![value isKindOfClass:[NSDictionary class]]) {
    return [NSDictionary dictionary];
  }
  return value;
}

@end
