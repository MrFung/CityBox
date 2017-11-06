//
//  GroupInfo.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseDTO.h"
#import "ProfileInfo.h"

@interface GroupInfo : BaseDTO

@property (nonatomic, strong) NSMutableArray *profileInfos;

+ (instancetype)groupInfoWithData:(NSDictionary *)data;

@end
