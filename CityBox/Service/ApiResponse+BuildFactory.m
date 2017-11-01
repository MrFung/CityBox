//
//  ApiResponse+BuildFactory.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiResponse+BuildFactory.h"
#import "NSString+Utility.h"
#import "NSDictionary+Utility.h"

@implementation ApiResponse (BuildFactory)

#pragma mark - Public Methods

+ (instancetype)responseWithCanteenJSON:(NSString *)json error:(NSError *)error {
  ApiResponse *response = [[self alloc] init];
  if (error || ![json isKindOfClass:[NSString class]]) {
    response.code = API_RESPONSE_CODE_INVALID;
  } else {
    NSError *error = 0 == json.length ? [NSError errorWithDomain:@"json" code:-1 userInfo:nil] : nil;
    response = [self responseWithCanteenDictionary:[json toDictionaryAsJSON] responseCode:200 error:error];
  }
  
  return response;
}

+ (instancetype)responseWithLoginJSON:(NSString *)json error:(NSError *)error {
  ApiResponse *response = [[self alloc] init];
  if (error || ![json isKindOfClass:[NSString class]]) {
    response.code = API_RESPONSE_CODE_INVALID;
  } else {
    NSError *error = 0 == json.length ? [NSError errorWithDomain:@"json" code:-1 userInfo:nil] : nil;
    response = [self responseWithLoginDictionary:[json toDictionaryAsJSON] responseCode:200 error:error];
  }
  
  return response;
}

+ (instancetype)responseWithLoginDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error {
  ApiResponse *response = [[self alloc] init];
  if (error || ![dictionary isKindOfClass:[NSDictionary class]]) {
    response.code = responseCode;
    response.errorMessage = @"无法连接服务器!";
  } else {
    response.code = API_RESPONSE_CODE_SUCCESS;
    response.data = dictionary;
  }
  return response;
}

+ (instancetype)responseWithCanteenDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error {
  ApiResponse *response = [[self alloc] init];
  if (error || ![dictionary isKindOfClass:[NSDictionary class]]) {
    response.code = responseCode;
    response.errorMessage = @"无法连接服务器!";
  } else {
    response.code = API_RESPONSE_CODE_SUCCESS;
    response.data = dictionary[@"yy"];
  }
  return response;
}

+ (instancetype)responseWithLibraryDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error {
  ApiResponse *response = [[self alloc] init];
  if (error || ![dictionary isKindOfClass:[NSDictionary class]]) {
    response.code = responseCode;
    response.errorMessage = @"无法连接服务器!";
  } else {
    response.code = API_RESPONSE_CODE_SUCCESS;
    response.data = dictionary[@"data"];
  }
  return response;
}

@end
