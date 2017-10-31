//
//  Profile+Utility.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/31.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "Profile+Utility.h"

@implementation Profile (Utility)

- (BOOL)isLogin {
  return (self.userName.length > 0);
}

@end
