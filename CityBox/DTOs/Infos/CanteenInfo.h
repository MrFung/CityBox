//
//  CanteenInfo.h
//  test
//
//  Created by 郭枫 on 2017/9/29.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseDTO.h"

@interface CanteenInfo : BaseDTO

@property (nonatomic, copy) NSString *menuId;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *floor;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *telephone;

+ (instancetype)canteenInfoWithData:(NSDictionary *)data;

@end
