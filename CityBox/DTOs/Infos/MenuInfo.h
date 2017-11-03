//
//  MenuInfo.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseDTO.h"

@interface MenuInfo : BaseDTO

@property (nonatomic, copy) NSString *menuId;
@property (nonatomic, copy) NSString *foodName;
@property (nonatomic, copy) NSString *foodPrice;

+ (instancetype)menuInfoWithData:(NSDictionary *)data;

@end
