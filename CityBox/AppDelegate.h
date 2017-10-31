//
//  AppDelegate.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/21.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

//- (void)saveContext;


@end

