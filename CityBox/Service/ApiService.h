//
//  ApiService.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiRequest+BuildFactory.h"
#import "ApiResponse+BuildFactory.h"

@protocol ApiServiceDelegate;

@interface ApiService : NSObject

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, weak) NSObject <ApiServiceDelegate> *delegate;

+ (id)serviceWithDelegate:(id <ApiServiceDelegate>)delegate;
+ (id)serviceWithTag:(NSInteger)tag delegate:(id <ApiServiceDelegate>)delegate;

- (void)sendJSONRequest:(ApiRequest *)apiRequest;
- (void)sendRequest:(ApiRequest *)apiRequest withResponseBuildBlock:(ApiResponse *(^)(id data, NSError *error))responseBuildBlock;

@end

@protocol ApiServiceDelegate <NSObject>

@optional

- (void)service:(ApiService *)service willStartRequest:(ApiRequest *)request;
- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response;

@end
