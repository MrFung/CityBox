//
//  ProfileInfo.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseDTO.h"

@interface ProfileInfo : BaseDTO

@property (nonatomic, copy) NSString *title;

+ (instancetype)profileInfoWithData:(NSDictionary *)data;

@end
