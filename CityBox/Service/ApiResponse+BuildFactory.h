//
//  ApiResponse+BuildFactory.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiResponse.h"

@interface ApiResponse (BuildFactory)

+ (instancetype)responseWithLoginJSON:(NSString *)json error:(NSError *)error;
+ (instancetype)responseWithJSON:(NSString *)json error:(NSError *)error;
+ (instancetype)responseWithLoginDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;
+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;

@end
