//
//  UIWebViewController+Configuration.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "UIWebViewController+Configuration.h"

@implementation UIWebViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
  self.progressView.hidden = NO;
}

- (void)configureView {
  [self configureWebView];
  [self configureTitleLabel];
}

#pragma mark - Private Methods

- (void)configureWebView {
  self.webView.delegate = self;
  
  self.webView.scrollView.showsVerticalScrollIndicator = NO;
  self.webView.scrollView.showsHorizontalScrollIndicator = NO;
  
  self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)configureTitleLabel {
  self.titleLabel.text = self.titleString;
}

@end
