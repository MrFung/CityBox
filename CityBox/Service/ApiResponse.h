//
//  ApiResponse.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>

#define API_RESPONSE_CODE_INVALID -1
#define API_RESPONSE_CODE_SUCCESS 1

@interface ApiResponse : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *errorCode;
@property (nonatomic, copy) NSString *errorMessage;
@property (nonatomic, strong) id data;

- (BOOL)isSucceed;

@end
