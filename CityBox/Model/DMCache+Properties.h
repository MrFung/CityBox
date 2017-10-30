//
//  DMCache+Properties.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "DMCache.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMCache (Properties)

@property (nullable, nonatomic, copy) NSString *key;
@property (nullable, nonatomic, copy) NSString *value;

@end

NS_ASSUME_NONNULL_END
