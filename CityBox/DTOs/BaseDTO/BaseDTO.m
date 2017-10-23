//
//  BaseDTO.m
//  test
//
//  Created by 郭枫 on 2017/9/29.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseDTO.h"

@implementation BaseDTO

+ (instancetype)create {
  NSAssert(false, @"-base DTO should never be created without subclass");
  return nil;
}

+ (BOOL)validateDictionaryData:(NSDictionary *)data {
  if (![data isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  return YES;
}

+ (BOOL)validateArrayData:(NSArray *)data {
  if (![data isKindOfClass:[NSArray class]]) {
    return NO;
  }
  return YES;
}

@end
