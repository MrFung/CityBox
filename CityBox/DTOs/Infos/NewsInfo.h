//
//  NewsInfo.h
//  CityBox
//
//  Created by 郭枫 on 2018/3/1.
//  Copyright © 2018年 郭枫. All rights reserved.
//

#import "BaseDTO.h"

@interface NewsInfo : BaseDTO

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *url;

+ (instancetype)newsInfoWithData:(NSDictionary *)data;

@end
