//
//  NSDictionary+Utility.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utility)

- (NSData *)toJSONData;

- (NSNumber *)integerForKey:(NSString *)key;
- (NSNumber *)integerForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue;
- (NSString *)stringForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;

@end
