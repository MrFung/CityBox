//
//  TabBarControllerWrapping.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TabBarControllerWrapping : NSObject <UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabBarController;

+ (instancetype)sharedInstance;
- (UITabBarController *)wrappedTabBarController;

@end
