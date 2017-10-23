//
//  BaseViewController.m
//  test
//
//  Created by 郭枫 on 2017/9/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "UINavigationController+Extend.h"
#import "TabBarControllerWrapping.h"
#import "LoginViewController.h"

NSInteger const Tabbar_Schedule_Page_Index = 0;
NSInteger const Tabbar_Canteen_Page_Index = 1;
NSInteger const Tabbar_Library_Page_Index = 2;

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (instancetype)create {
  NSAssert(false, @"-base view controller should never be created without subclass");
  return nil;
}

+ (instancetype)createWithStoryboardName:(StoryboardName)storyboardName {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[self storyboardNameToString:storyboardName] bundle:nil];
  BaseViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
  
  return viewController;
}

+ (NSString *)storyboardNameToString:(StoryboardName)storyboardName {
  NSString *stringName = @"";
  
  switch (storyboardName) {
    case StoryboardNameLaunchScreen: stringName = @"LaunchScreen"; break;
    case StoryboardNameLogin: stringName = @"Login"; break;
    case StoryboardNameHome: stringName = @"Home"; break;
  }
  
  return stringName;
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Show Views

+ (void)showLoginView {
  [BaseViewController createAndPresentLoginViewWithCompletion:^{
    [BaseViewController clearUpViewControllersForRootNavigationController];
  }];
}

+ (void)resetTabThenSelectedHome {
  [BaseViewController createTabViewAndSelectedIndex:Tabbar_Schedule_Page_Index];
}

+ (void)createTabViewAndSelectedIndex:(NSInteger)selectedIndex {
  UINavigationController *rootNavigationController = [UINavigationController getRootNavigationController];
  UITabBarController *tabbarController = [[TabBarControllerWrapping sharedInstance] wrappedTabBarController];
  [rootNavigationController pushViewControllerFromFade:tabbarController];
  rootNavigationController.viewControllers = @[tabbarController];
  tabbarController.selectedIndex = selectedIndex;
}

#pragma mark - Refresh Configure

- (void)toast:(NSString *)message {
  [self toast:message delay:1.5f];
}

- (void)toast:(NSString *)message delay:(CGFloat)delay {
  MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  HUD.mode = MBProgressHUDModeText;
  HUD.detailsLabelText = message;
  HUD.detailsLabelFont = [UIFont systemFontOfSize:14.0f];
  HUD.opacity = 0.85;
  [HUD hide:YES afterDelay:delay];
}

#pragma mark - Private Methods

+ (void)createAndPresentLoginViewWithCompletion:(void(^)(void))completion {
  UINavigationController *loginViewNavigationController = [UINavigationController wrappingRootController:[LoginViewController create]];
  
  UINavigationController *rootNavigationController = [UINavigationController getRootNavigationController];
  [rootNavigationController presentViewController:loginViewNavigationController animated:YES completion:^{
    if (completion) {
      completion();
    }
  }];
}

+ (void)clearUpViewControllersForRootNavigationController {
  UINavigationController *rootNavigationController = [UINavigationController getRootNavigationController];
  
  for (UIViewController *viewController in rootNavigationController.viewControllers) {
    if ([viewController isKindOfClass:[UITabBarController class]]) {
      UITabBarController *tabBarController = (UITabBarController *)viewController;
      
      for (UINavigationController *vc in tabBarController.viewControllers) {
        if ([vc isKindOfClass:[UINavigationController class]]) {
          UINavigationController *navigationController = (UINavigationController *)vc;
          
          NSMutableArray *navigationVCArray = [NSMutableArray arrayWithArray:navigationController.viewControllers];
          [navigationVCArray removeAllObjects];
          navigationController.viewControllers = navigationVCArray;
        }
      }
    }
  }
  
  NSMutableArray *rootNavigationVCArray = [NSMutableArray arrayWithArray:rootNavigationController.viewControllers];
  [rootNavigationVCArray removeAllObjects];
  rootNavigationController.viewControllers = rootNavigationVCArray;
}


@end
