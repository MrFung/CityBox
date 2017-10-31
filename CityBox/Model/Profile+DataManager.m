//
//  CoreDataClass+DataManager.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/24.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "Profile+DataManager.h"
#import "Profile+Deserializer.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation Profile (DataManager)

#pragma mark - Public Methods

+ (instancetype)current {
  return [Profile MR_findFirst];
}

+ (instancetype)currentInContext:(NSManagedObjectContext *)context {
  return [Profile MR_findFirstInContext:context];
}

+ (void)createOrUpdateFromDictionaryData:(NSDictionary *)data completion:(void (^)(BOOL, NSError *))completion {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *context) {
    Profile *profile = [self currentInContext:context] ?: [Profile MR_createEntityInContext:context];
    [profile updateFromDictionaryData:data];
  } completion:completion];
}

@end
