//
//  DMCache+Deserializer.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "DMCache.h"

@interface DMCache (Deserializer)

+ (BOOL)validateDictionaryData:(NSDictionary *)data;
- (void)updateFromDictionaryData:(NSDictionary *)data;

@end
