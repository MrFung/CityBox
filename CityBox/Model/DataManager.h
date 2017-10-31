//
//  DataManager.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/24.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (void)cleanUpWithCompletion:(void(^)(BOOL success, NSError *error))completion;

@end
