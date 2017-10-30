//
//  CoreDataClass+DataManager.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/24.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CoreDataClass.h"

@interface CoreDataClass (DataManager)

+ (instancetype)current;
+ (instancetype)currentInContext:(NSManagedObjectContext *)context;

+ (void)createOrUpdateFromDictionaryData:(NSDictionary *)data completion:(void(^)(BOOL success, NSError *error))completion;

@end
