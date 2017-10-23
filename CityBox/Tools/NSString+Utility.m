//
//  NSString+Utility.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)

- (NSDictionary *)toDictionaryAsJSON {
  id result = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
  if ([result isKindOfClass:[NSString class]]) {
    result = [result toDictionaryAsJSON];
  }
  return result;
}

- (BOOL)isNotBlank {
  BOOL isNotBlank = NO;
  NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  NSString *trimmed = [self stringByTrimmingCharactersInSet:whitespace];
  if ([trimmed length] > 0) {
    isNotBlank = YES;
  }
  return isNotBlank;
}

@end
