//
//  UINavigationController+Extend.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Extend)

+ (instancetype)wrappingRootController:(UIViewController *)viewController;
+ (UINavigationController *)getRootNavigationController;

- (void)pushViewControllerFromLeft:(UIViewController*)viewController;
- (void)pushViewControllerFromBottom:(UIViewController*)viewController;
- (void)pushViewControllerFromTop:(UIViewController*)viewController;
- (void)pushViewControllerFromFade:(UIViewController *)viewController;

- (void)popViewControllerTrendRight;
- (void)popViewControllerTrendTop;
- (void)popViewControllerTrendBottom;
- (void)popViewControllerTrendFade ;

- (void)popToViewControllerTrendRight:(UIViewController *)viewController;
- (void)popToViewControllerTrendTop:(UIViewController *)viewController;
- (void)popToViewControllerTrendBottom:(UIViewController *)viewController;
- (void)popToViewControllerTrendFade:(UIViewController *)viewController;

@end
