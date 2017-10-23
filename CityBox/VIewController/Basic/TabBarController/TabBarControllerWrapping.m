//
//  TabBarControllerWrapping.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "TabBarControllerWrapping.h"
#import "ScheduleViewController.h"
#import "CanteenViewController.h"
#import "LibraryViewController.h"
#import "ProfileViewController.h"
#import "UINavigationController+Extend.h"
#import "UIView+Utility.h"
#import "UIColor+Utility.h"

@implementation TabBarControllerWrapping

+ (instancetype)sharedInstance {
  static TabBarControllerWrapping *tabBarControllerWrapping = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    tabBarControllerWrapping = [[TabBarControllerWrapping alloc] init];
  });
  
  return tabBarControllerWrapping;
}

- (UITabBarController *)wrappedTabBarController {
  self.tabBarController = [[UITabBarController alloc] init];
  self.tabBarController.delegate = self;
  [self.tabBarController.tabBar topBorderWithColor:[UIColor mainGrayColor] height:0.5];
  
  UINavigationController *scheduleViewController = [UINavigationController wrappingRootController:[ScheduleViewController create]];
  UIImage *scheduleVCImage = [UIImage imageNamed:@""];
  UIImage *scheduleVCHLImage = [UIImage imageNamed:@""];
  UITabBarItem *scheduleTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tab1" image:scheduleVCImage selectedImage:scheduleVCHLImage];
  scheduleTabBarItem.tag = 1;
  scheduleViewController.tabBarItem = scheduleTabBarItem;
  
  UINavigationController *canteenViewController = [UINavigationController wrappingRootController:[CanteenViewController create]];
  UIImage *canteenVCImage = [UIImage imageNamed:@""];
  UIImage *canteenVCHLImage = [UIImage imageNamed:@""];
  UITabBarItem *canteenTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tab2" image:canteenVCImage selectedImage:canteenVCHLImage];
  canteenTabBarItem.tag = 2;
  canteenViewController.tabBarItem = canteenTabBarItem;
  
  UINavigationController *libraryViewController = [UINavigationController wrappingRootController:[LibraryViewController create]];
  UIImage *libraryVCImage = [UIImage imageNamed:@""];
  UIImage *libraryVCHLImage = [UIImage imageNamed:@""];
  UITabBarItem *libraryTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tab3" image:libraryVCImage selectedImage:libraryVCHLImage];
  libraryTabBarItem.tag = 3;
  libraryViewController.tabBarItem = libraryTabBarItem;
  
  UINavigationController *profileViewController = [UINavigationController wrappingRootController:[ProfileViewController create]];
  UIImage *profileVCImage = [UIImage imageNamed:@""];
  UIImage *profileVCHLImage = [UIImage imageNamed:@""];
  UITabBarItem *profileTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tab4" image:profileVCImage selectedImage:profileVCHLImage];
  profileTabBarItem.tag = 4;
  profileViewController.tabBarItem = profileTabBarItem;
  
  self.tabBarController.viewControllers = @[
                                            scheduleViewController,
                                            canteenViewController,
                                            libraryViewController,
                                            profileViewController
                                            ];
  
  [scheduleViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
  [canteenViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
  [libraryViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
  [profileViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
  
  [scheduleViewController.tabBarItem setImageInsets:UIEdgeInsetsMake(-1, 0, 1, 0)];
  [canteenViewController.tabBarItem setImageInsets:UIEdgeInsetsMake(-1, 0, 1, 0)];
  [libraryViewController.tabBarItem setImageInsets:UIEdgeInsetsMake(-1, 0, 1, 0)];
  [profileViewController.tabBarItem setImageInsets:UIEdgeInsetsMake(-1, 0, 1, 0)];
  
  // 选中后的图片颜色
  self.tabBarController.tabBar.tintColor = [UIColor mainBlueColor];
  
  // 效果是去掉背景色
  [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
  [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
  self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
  
  //效果是背景浅灰色
  //  [tabBarController.tabBar setValue:@(YES) forKeyPath:@"_hidesShadow"];
  
  //未选中字体颜色
  [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f]} forState:UIControlStateNormal];
  //选中字体颜色
  [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor mainBlueColor], NSFontAttributeName:[UIFont systemFontOfSize:12.f]} forState:UIControlStateSelected];
  
  return self.tabBarController;
}

@end
