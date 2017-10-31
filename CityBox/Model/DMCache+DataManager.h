//
//  DMCache+DataManager.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "DMCache+CoreDataClass.h"

@interface DMCache (DataManager)

+ (instancetype)findByKey:(NSString *)key;
+ (void)createOrUpdateByDictionaryData:(NSDictionary *)data key:(NSString *)key completion:(void(^)(BOOL success, NSError *error))completion;

@end
