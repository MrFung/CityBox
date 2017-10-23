//
//  UIColor+Utility.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "UIColor+Utility.h"

@implementation UIColor (Utility)

+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view bounds:(CGRect)bounds fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr {
  //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
  CAGradientLayer *gradientLayer = [CAGradientLayer layer];
  //  创建渐变色数组，需要转换为CGColor颜色
  gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHexString:toHexColorStr].CGColor];
  //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
  gradientLayer.startPoint = CGPointMake(0, 0.5);
  gradientLayer.endPoint = CGPointMake(1, 0.5);
  //  设置颜色变化点，取值范围 0.0~1.0
  gradientLayer.locations = @[@0,@1];
  
  [view.layer addSublayer:gradientLayer];
  
  return gradientLayer;
}

+ (instancetype)mainBlueColor {
  return [UIColor colorWithHexString:@"1b8fe6" alpha:1.f];
}

+ (instancetype)mainBlackColor {
  return [UIColor colorWithHexString:@"333333" alpha:1.f];
}

+ (instancetype)mainGrayColor {
  return [UIColor colorWithHexString:@"e5e5e5" alpha:1.f];
}

+ (instancetype)mainBackgroundColor {
  return [UIColor colorWithHexString:@"f8f9fa" alpha:1.f];
}

+ (instancetype)mainBorderColor {
  return [UIColor colorWithHexString:@"e5e5e5" alpha:1.f];
}

+ (instancetype)colorWithHexString:(NSString *)hexString {
  return [self colorWithHexString:hexString alpha:1.f];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
  //-----------------------------------------
  // Convert hex string to an integer
  //-----------------------------------------
  unsigned int hexint = 0;
  
  // Create scanner
  NSScanner *scanner = [NSScanner scannerWithString:hexString];
  
  // Tell scanner to skip the # character
  [scanner setCharactersToBeSkipped:[NSCharacterSet
                                     characterSetWithCharactersInString:@"#"]];
  [scanner scanHexInt:&hexint];
  
  //-----------------------------------------
  // Create color object, specifying alpha
  //-----------------------------------------
  UIColor *color =
  [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                  green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                   blue:((CGFloat) (hexint & 0xFF))/255
                  alpha:alpha];
  
  return color;
}

@end
