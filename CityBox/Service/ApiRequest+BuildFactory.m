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
#define PATH_MENU @"http://123.206.60.17/csxyxzs-master/index.php/Home/Campus/appCaidan/id/"
#define PATH_GRADE @"http://123.206.60.17:5000/api/grade"
//#define PATH_CLASSSCHEDULE @"http://123.206.60.17:5000/api/schedule"
#define PATH_NEWS @"http://v.juhe.cn/toutiao/index?type=top&key=722a4aa064e87da8e07848b8971d893a"
#define PATH_UNIVERSITY_PANARAMA @"http://720yun.com/t/a9625wa6xnw?from=singlemessage&openSpeakModal=true&pano_id=62962"

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
  NSString *requestUrl = [NSString stringWithFormat:@"%@%@", PATH_MENU, menuId];
  ApiRequest *request = [self requestWithPath:requestUrl];
  request.type = ApiRequestTypeMenu;
  request.method = ApiRequestMethodGet;
  //request.parameters = [NSDictionary dictionaryWithObjects:@[menuId] forKeys:@[@"id"]];
  
  return request;
}

+ (instancetype)requestForGrade:(NSString *)username password:(NSString *)password time:(NSString *)termstring action:(NSString *)action {
  ApiRequest *request = [self requestWithPath:PATH_GRADE];
  request.type = ApiRequestTypeGrade;
  request.parameters = [NSDictionary dictionaryWithObjects:@[username, password, termstring, action] forKeys:@[@"username", @"password", @"termstring", @"action"]];
  
  return request;
}

+ (instancetype)requestForNews {
  ApiRequest *request = [self requestWithPath:PATH_NEWS];
  request.type = ApiRequestTypeNews;
  request.method = ApiRequestMethodGet;
  //request.parameters = [NSDictionary dictionaryWithObjects:@[type, key] forKeys:@[@"type", @"key"]];
  
  return request;
}

#pragma mark - URLs

+ (NSString *)urlForUniversityPanorama {
  return PATH_UNIVERSITY_PANARAMA;
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
