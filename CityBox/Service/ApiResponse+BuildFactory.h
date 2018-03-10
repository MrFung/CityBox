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
+ (instancetype)responseWithCanteenJSON:(NSString *)json error:(NSError *)error;
+ (instancetype)responseWithLoginDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;
+ (instancetype)responseWithNewsDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;
+ (instancetype)responseWithCanteenDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;
+ (instancetype)responseWithMenuDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;
+ (instancetype)responseWithLibraryDictionary:(NSDictionary *)dictionary responseCode:(NSInteger)responseCode error:(NSError *)error;

@end
