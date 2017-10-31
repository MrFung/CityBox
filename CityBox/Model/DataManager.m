//
//  DataManager.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/24.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "DataManager.h"
#import "Profile+CoreDataClass.h"
#import "DMCache+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation DataManager

+ (void)cleanUpWithCompletion:(void(^)(BOOL success, NSError *error))completion {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *context) {
    [Profile MR_truncateAllInContext:context];
    [DMCache MR_truncateAllInContext:context];
  } completion:completion];
}

@end
