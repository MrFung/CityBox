//
//  CoreDataClass+Deserializer.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "Profile+CoreDataClass.h"

@interface Profile (Deserializer)

- (void)updateFromDictionaryData:(NSDictionary *)data;

@end
