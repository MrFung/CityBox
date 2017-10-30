//
//  DMCache+DataManager.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "DMCache+DataManager.h"
#import "DMCache+Deserializer.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation DMCache (DataManager)

#pragma mark - Public Methods

+ (void)createOrUpdateByDictionaryData:(NSDictionary *)data key:(NSString *)key completion:(void (^)(BOOL, NSError *))completion {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *context) {
    [self createOrUpdateByDictionaryData:data key:key inContext:context];
  } completion:completion];
}

#pragma mark - Private Methods

+ (instancetype)createOrUpdateByDictionaryData:(NSDictionary *)data key:(NSString *)key inContext:(NSManagedObjectContext *)context {
  if (![self validateDictionaryData:data]) {
    return nil;
  }
  DMCache *cache = [self findOrCreateByKey:key inContext:context];
  [cache updateFromDictionaryData:data];
  
  return cache;
}

+ (instancetype)findOrCreateByKey:(NSString *)key inContext:(NSManagedObjectContext *)context {
  DMCache *cache = [self findByKey:key inContext:context];
  if (!cache) {
    cache = [self MR_createEntityInContext:context];
    cache.key = key;
  }
  
  return cache;
}

+ (instancetype)findByKey:(NSString *)key inContext:(NSManagedObjectContext *)context {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key == %@", key];
  
  return [DMCache MR_findFirstWithPredicate:predicate inContext:context];
}

@end
