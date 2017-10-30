//
//  CoreDataClass+DataManager.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/24.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CoreDataClass+DataManager.h"
#import "CoreDataClass+Deserializer.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation CoreDataClass (DataManager)

#pragma mark - Public Methods

+ (instancetype)current {
  return [CoreDataClass MR_findFirst];
}

+ (instancetype)currentInContext:(NSManagedObjectContext *)context {
  return [CoreDataClass MR_findFirstInContext:context];
}

+ (void)createOrUpdateFromDictionaryData:(NSDictionary *)data completion:(void (^)(BOOL, NSError *))completion {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *context) {
    CoreDataClass *profile = [self currentInContext:context] ?: [CoreDataClass MR_createEntityInContext:context];
    [profile updateFromDictionaryData:data];
  } completion:completion];
}

@end
