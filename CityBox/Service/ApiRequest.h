//
//  ApiRequest.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  ApiRequestTypeLogin,                //登录
  ApiRequestTypeLibrary,              //图书馆
  ApiRequestTypeCanteen,            //食堂
  ApiRequestTypeMenu,                //菜单
  ApiRequestTypeGrade,                //成绩
  ApiRequestTypeNews,                 //新闻
} ApiRequestType;

typedef enum {
  ApiRequestMethodGet,
  ApiRequestMethodPost,
} ApiRequestMethod;

typedef enum {
  ApiRequestContentJSON,
} ApiRequestContent;

@interface ApiRequest : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, assign) ApiRequestType type;
@property (nonatomic, assign) ApiRequestMethod method;
@property (nonatomic, assign) ApiRequestContent content;

@end
