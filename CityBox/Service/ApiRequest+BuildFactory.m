//
//  ApiRequest+BuildFactory.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiRequest+BuildFactory.h"

#define PATH_LOGIN @"http://123.206.60.17:5000/api/login"
#define PATH_LIBRARY @"http://123.206.60.17/csxyxzs-master/index.php/Home/Campus/appLibrary/title/"
#define PATH_CANTEEN @"http://123.206.60.17/csxyxzs-master/index.php/Home/Campus/appShitang"
#define PATH_MENU @"http://123.206.60.17/csxyxzs-master/index.php/Home/Campus/appCaidan"
#define PATH_GRADE @"http://123.206.60.17:5000/api/grade"
#define PATH_CLASSSCHEDULE @"http://123.206.60.17:5000/api/schedule"

@implementation ApiRequest (BuildFactory)

#pragma mark - Public Methods

+ (instancetype)requestForLogin:(NSString *)username password:(NSString *)password {
  ApiRequest *request = [self requestWithPath:PATH_LOGIN];
  request.type = ApiRequestTypeLogin;
//  request.parameters = @{@"username":_username, @"password":_password};
  request.parameters = [NSDictionary dictionaryWithObjects:@[username, password] forKeys:@[@"username", @"password"]];
  
  return request;
}

+ (instancetype)requestForLibrary:(NSString *)bookName {
  NSString *requestUrl = [NSString stringWithFormat:@"%@%@", PATH_LIBRARY, bookName];
  ApiRequest *request = [self requestWithPath:requestUrl];
  request.type = ApiRequestTypeLibrary;
  request.method = ApiRequestMethodGet;
  
  return request;
}

+ (instancetype)requestForCanteen {
  ApiRequest *request = [self requestWithPath:PATH_CANTEEN];
  request.type = ApiRequestTypeCanteen;
  
  return request;
}

+ (instancetype)requestForMenu:(NSString *)menuId {
  ApiRequest *request = [self requestWithPath:PATH_MENU];
  request.type = ApiRequestTypeMenu;
  request.parameters = [NSDictionary dictionaryWithObjects:@[menuId] forKeys:@[@"id"]];
  
  return request;
}

+ (instancetype)requestForGrade:(NSString *)username password:(NSString *)password time:(NSString *)termstring action:(NSString *)action {
  ApiRequest *request = [self requestWithPath:PATH_GRADE];
  request.type = ApiRequestTypeGrade;
  request.parameters = [NSDictionary dictionaryWithObjects:@[username, password, termstring, action] forKeys:@[@"username", @"password", @"termstring", @"action"]];
  
  return request;
}

+ (instancetype)requestForClassSchedule:(NSString *)username password:(NSString *)password action:(NSString *)action {
  ApiRequest *request = [self requestWithPath:PATH_CLASSSCHEDULE];
  request.type = ApiRequestTypeClassSchedule;
  request.parameters = [NSDictionary dictionaryWithObjects:@[username, password, action] forKeys:@[@"username", @"password", @"action"]];
  
  return request;
}

#pragma mark - Private Methods

+ (instancetype)requestWithPath:(NSString *)path {
  ApiRequest *request = [[ApiRequest alloc] init];
  request.url = path;
  request.method = ApiRequestMethodPost;
  request.content = ApiRequestContentJSON;
  request.parameters = [NSMutableDictionary dictionary];
  
  return request;
}

@end
