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
  UIImage *scheduleVCImage = [UIImage imageNamed:@"tabbar_schedule_unselected"];
  UIImage *scheduleVCHLImage = [UIImage imageNamed:@"tabbar_schedule"];
  UITabBarItem *scheduleTabBarItem = [[UITabBarItem alloc] initWithTitle:@"课表" image:scheduleVCImage selectedImage:scheduleVCHLImage];
  scheduleTabBarItem.tag = 1;
  scheduleViewController.tabBarItem = scheduleTabBarItem;
  
  UINavigationController *canteenViewController = [UINavigationController wrappingRootController:[CanteenViewController create]];
  UIImage *canteenVCImage = [UIImage imageNamed:@"tabbar_canteen_unselected"];
  UIImage *canteenVCHLImage = [UIImage imageNamed:@""];
  UITabBarItem *canteenTabBarItem = [[UITabBarItem alloc] initWithTitle:@"食堂" image:canteenVCImage selectedImage:canteenVCHLImage];
  canteenTabBarItem.tag = 2;
  canteenViewController.tabBarItem = canteenTabBarItem;
  
  UINavigationController *libraryViewController = [UINavigationController wrappingRootController:[LibraryViewController create]];
  UIImage *libraryVCImage = [UIImage imageNamed:@"babbar_library_unselected"];
  UIImage *libraryVCHLImage = [UIImage imageNamed:@"babbar_library"];
  UITabBarItem *libraryTabBarItem = [[UITabBarItem alloc] initWithTitle:@"图书" image:libraryVCImage selectedImage:libraryVCHLImage];
  libraryTabBarItem.tag = 3;
  libraryViewController.tabBarItem = libraryTabBarItem;
  
  UINavigationController *profileViewController = [UINavigationController wrappingRootController:[ProfileViewController create]];
  UIImage *profileVCImage = [UIImage imageNamed:@"tabbar_me_unselected"];
  UIImage *profileVCHLImage = [UIImage imageNamed:@"tabbar_me"];
  UITabBarItem *profileTabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:profileVCImage selectedImage:profileVCHLImage];
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
