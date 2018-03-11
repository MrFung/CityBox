//
//  BaseViewController.h
//  test
//
//  Created by 郭枫 on 2017/9/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

typedef NS_ENUM(NSInteger, StoryboardName) {
  StoryboardNameLaunchScreen = 0,
  StoryboardNameLogin = 1,
  StoryboardNameHome = 2,
};

@interface BaseViewController : UIViewController

+ (instancetype)create;
+ (instancetype)createWithStoryboardName:(StoryboardName)storyboardName;

+ (void)showLoginView;
+ (void)resetTabThenSelectedHome;

- (MJRefreshHeader *)configureHeaderRefreshWithTarget:(id)target refreshingAction:(SEL)action;

- (void)toast:(NSString *)message;
- (void)toast:(NSString *)message delay:(CGFloat)delay;

- (void)updateKeyboardManagerWithBottomHeight:(CGFloat)bottomHeight;
- (void)updateKeyboardManagerWithPreviousNextHidden:(BOOL)previousNextHidden;
- (void)updateKeyboardManagerEnableToolbar:(BOOL)enableToolbar withPreviousNextHidden:(BOOL)previousNextHidden;
- (void)addAutoDismissKeyboardGesture;

- (void)cleanUpForUserDataWithCompletion:(void (^)(void))completion;

- (void)popGestureRecognizerDisable;

@end
