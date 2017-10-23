//
//  UIColor+Utility.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utility)

/**
 * Set Gradual Color
 **/
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view bounds:(CGRect)bounds fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

/**
 * The main blue color #1b8fe6
 **/
+ (instancetype)mainBlueColor;

/**
 * The main black color #333333
 **/
+ (instancetype)mainBlackColor;

/**
 * The main gray color #e5e5e5
 **/
+ (instancetype)mainGrayColor;

/**
 * The main background color #f8f9fa
 **/
+ (instancetype)mainBackgroundColor;

/**
 * The main background color #e5e5e5
 **/
+ (instancetype)mainBorderColor;

/**
 * The color with Hex string, Default Alpha is 1.f
 **/
+ (instancetype)colorWithHexString:(NSString *)hexString;

/**
 * The color with Hex string
 **/
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
