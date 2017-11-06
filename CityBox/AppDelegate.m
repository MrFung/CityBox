//
//  AppDelegate.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/21.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "AppDelegate.h"
#import "UINavigationController+Extend.h"
#import "LoginViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSLog(@"didFinishLaunchingWithOptions");
  
  [self configureCoreData];
  [self configureKeyboardManager];
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [self navigationController];
  [self.window makeKeyAndVisible];
  
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  NSLog(@"applicationWillResignActive");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  NSLog(@"applicationDidEnterBackground");
  
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  NSLog(@"applicationWillEnterForeground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  NSLog(@"applicationDidBecomeActive");
}


- (void)applicationWillTerminate:(UIApplication *)application {
  NSLog(@"applicationWillTerminate");
  [MagicalRecord cleanUp];
}

#pragma mark - Core Data stack

- (void)configureCoreData {
  [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelDebug];
  [MagicalRecord setShouldAutoCreateManagedObjectModel:NO];

  NSURL *modeURL = [[NSBundle mainBundle] URLForResource:@"CityBox" withExtension:@"momd"];
  NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modeURL];
  [NSManagedObjectModel MR_setDefaultManagedObjectModel:objectModel];
  [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"CityBox.sqlite"];
}

#pragma mark - Private Methods

- (UINavigationController *)navigationController {
  return [UINavigationController wrappingRootController:[LoginViewController create]];
}

- (void)configureKeyboardManager {
  IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
  manager.enable = YES;
  manager.enableAutoToolbar = YES;
  manager.previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysHide;
  manager.shouldShowToolbarPlaceholder = NO;
  manager.shouldResignOnTouchOutside = YES;
  manager.shouldToolbarUsesTextFieldTintColor = YES;
  manager.keyboardDistanceFromTextField = 16.f;
}

@end
