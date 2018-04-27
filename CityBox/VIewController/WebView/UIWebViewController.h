//
//  UIWebViewController.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/6.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"

@interface UIWebViewController : BaseViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong) NSTimer *progressTimer;
@property (nonatomic, assign) BOOL isFinished;

@end
