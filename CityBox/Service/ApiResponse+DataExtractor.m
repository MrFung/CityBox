//
//  ApiResponse+DataExtractor.m
//  test
//
//  Created by 郭枫 on 2017/9/26.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiResponse+DataExtractor.h"

@implementation ApiResponse (DataExtractor)

- (NSString *)userName {
  return [self.data isKindOfClass:[NSDictionary class]] ? [self.data stringForKey:@"username"] : @"";
}

- (NSString *)passWord {
  return [self.data isKindOfClass:[NSDictionary class]] ? [self.data stringForKey:@"password"] : @"";
}

@end
