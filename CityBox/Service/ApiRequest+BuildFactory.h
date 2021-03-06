//
//  ApiRequest+BuildFactory.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiRequest.h"

@interface ApiRequest (BuildFactory)

+ (instancetype)requestForLogin:(NSString *)username password:(NSString *)password;
+ (instancetype)requestForLibrary:(NSString *)bookName;
+ (instancetype)requestForCanteen;
+ (instancetype)requestForMenu:(NSString *)menuId;
+ (instancetype)requestForGrade:(NSString *)username password:(NSString *)password time:(NSString *)termstring action:(NSString *)action;
+ (instancetype)requestForNews;

+ (NSString *)urlForUniversityPanorama;

@end
