//
//  BaseDTO.h
//  test
//
//  Created by 郭枫 on 2017/9/29.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Utility.h"
#import "NSString+Utility.h"

@interface BaseDTO : NSObject

+ (instancetype)create;
+ (BOOL)validateDictionaryData:(NSDictionary *)data;
+ (BOOL)validateArrayData:(NSArray *)data;

@end
