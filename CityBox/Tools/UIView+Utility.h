//
//  UIView+Utility.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utility)

- (void)updateBorderColor:(UIColor *)color;
- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)width cornerRadius:(CGFloat)cornerRadius;
- (void)shadowRectangleWithShadowArea:(CGFloat)shadowArea cornerRadius:(CGFloat)cornerRadius opacity:(CGFloat)opacity;
- (void)shadowRectangleWithShadowArea:(CGFloat)shadowArea cornerRadius:(CGFloat)cornerRadius opacity:(CGFloat)opacity offset:(CGSize)offset;
- (void)innerTextViewShadowWithArea:(CGFloat)shadowArea cornerRadius:(CGFloat)cornerRadius opacity:(CGFloat)opacity width:(CGFloat)width;
- (void)bottomBorderWithColor:(UIColor *)color height:(CGFloat)height bottomSpace:(CGFloat)bottomSpace;
- (void)bottomBorderWithColor:(UIColor *)color height:(CGFloat)height;
- (void)topBorderWithColor:(UIColor *)color height:(CGFloat)height;

@end
