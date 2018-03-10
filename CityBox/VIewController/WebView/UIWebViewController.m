//
//  UIWebViewController.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "UIWebViewController.h"
#import "UIWebViewController+Configuration.h"
#import "ApiRequest+BuildFactory.h"

@interface UIWebViewController ()

@end

@implementation UIWebViewController

+ (instancetype)create {
  return [UIWebViewController createWithStoryboardName:StoryboardNameHome];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initProperties];
  [self configureView];
  [self loadWebView];
}

#pragma mark - IBAction Methods

- (IBAction)backClicked:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
  self.isFinished = NO;
  self.progressView.progress = 0.f;
  self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  self.isFinished = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  if ([error code] == NSURLErrorCancelled) {
    return;
  }
  
  self.progressView.hidden = YES;
}

#pragma mark - Private Methods

- (void)loadWebView {
  NSURL *url = [NSURL URLWithString:self.urlString];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  [self.webView loadRequest:request];
}

- (void)timerCallback {
  if (self.isFinished) {
    if (self.progressView.progress >= 1) {
      self.progressView.hidden = YES;
      [self.progressTimer invalidate];
    } else {
      self.progressView.progress += 0.1;
    }
  } else {
    self.progressView.progress += 0.05;
    if (self.progressView.progress >= 0.95) {
      self.progressView.progress = 0.95;
    }
  }
}

@end
