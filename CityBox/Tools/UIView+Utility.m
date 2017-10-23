//
//  UIView+Utility.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)

- (void)updateBorderColor:(UIColor *)color {
  [self.layer setBorderColor:[color CGColor]];
}

- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)width cornerRadius:(CGFloat)cornerRadius {
  [self.layer setBorderColor:[color CGColor]];
  [self.layer setBorderWidth:width];
  [self.layer setCornerRadius:cornerRadius];
  [self.layer setMasksToBounds:YES];
  [self setClipsToBounds:YES];
}

- (void)shadowRectangleWithShadowArea:(CGFloat)shadowArea cornerRadius:(CGFloat)cornerRadius opacity:(CGFloat)opacity {
  [self shadowRectangleWithShadowArea:shadowArea cornerRadius:cornerRadius opacity:opacity offset:CGSizeMake(0, 0)];
}

- (void)shadowRectangleWithShadowArea:(CGFloat)shadowArea cornerRadius:(CGFloat)cornerRadius opacity:(CGFloat)opacity offset:(CGSize)offset {
  self.layer.shadowColor = [UIColor blackColor].CGColor;
  self.layer.shadowRadius = shadowArea;
  self.layer.shadowOffset = offset;
  self.layer.shadowOpacity = opacity;
}

- (void)bottomBorderWithColor:(UIColor *)color height:(CGFloat)height bottomSpace:(CGFloat)bottomSpace {
  CALayer *bottomBorder = [CALayer layer];
  bottomBorder.backgroundColor = [color CGColor];
  bottomBorder.frame = CGRectMake(0, CGRectGetHeight(self.frame) - bottomSpace, CGRectGetWidth(self.frame), height);
  [self.layer addSublayer:bottomBorder];
}

- (void)bottomBorderWithColor:(UIColor *)color height:(CGFloat)height {
  [self bottomBorderWithColor:color height:height bottomSpace:0];
}

- (void)topBorderWithColor:(UIColor *)color height:(CGFloat)height {
  CALayer *topBorder = [CALayer layer];
  topBorder.backgroundColor = [color CGColor];
  topBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), height);
  [self.layer addSublayer:topBorder];
}

- (void)innerTextViewShadowWithArea:(CGFloat)shadowArea cornerRadius:(CGFloat)cornerRadius opacity:(CGFloat)opacity width:(CGFloat)width {
  CAShapeLayer* shadowLayer = [CAShapeLayer layer];
  [shadowLayer setFrame:self.bounds];
  [shadowLayer setShadowColor:[[UIColor grayColor] CGColor]];
  [shadowLayer setShadowOffset:CGSizeMake(0.f, 0.f)];
  [shadowLayer setShadowOpacity:1.f];
  [shadowLayer setShadowRadius:1.f];
  
  [shadowLayer setFillRule:kCAFillRuleEvenOdd];
  
  CGMutablePathRef path = CGPathCreateMutable();
  CGPathAddRect(path, NULL, CGRectInset(CGRectMake(0, 0, width, self.bounds.size.height), -5, -5));
  
  CGMutablePathRef someInnerPath = CGPathCreateMutable();
  CGPathAddRect(someInnerPath, NULL, CGRectInset(CGRectMake(0, 0, width, self.bounds.size.height), 0, 0));
  
  CGPathAddPath(path, NULL, someInnerPath);
  CGPathCloseSubpath(path);
  [shadowLayer setPath:path];
  CGPathRelease(path);
  
  CAShapeLayer* maskLayer = [CAShapeLayer layer];
  [maskLayer setPath:someInnerPath];
  [shadowLayer setMask:maskLayer];
  [[self layer] addSublayer:shadowLayer];
}

@end
