//
//  BaseViewController.m
//  test
//
//  Created by 郭枫 on 2017/9/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"

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

#pragma mark - Private Methods



@end
