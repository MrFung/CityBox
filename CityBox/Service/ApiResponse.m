//
//  ApiResponse.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiResponse.h"

@implementation ApiResponse

- (BOOL)isSucceed {
  return API_RESPONSE_CODE_SUCCESS == self.code;
}

@end
