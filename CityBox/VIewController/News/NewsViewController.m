//
//  NewsViewController.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewController+Configuration.h"
#import "NewsViewController+LogicFlow.h"
#import "UIWebViewController.h"
#import "NewsCell.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

+ (instancetype)create {
  return [NewsViewController createWithStoryboardName:StoryboardNameHome];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initProperties];
  [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self loadData];
}

#pragma mark - Public Methods

- (void)reloadDatas {
  [self.tableView reloadData];
}

- (void)loadNewDatas {
  [self loadData];
  [self.tableView.mj_header beginRefreshing];
  self.tableView.mj_header.hidden = YES;
}

- (void)stopRefresh {
  self.tableView.mj_header.hidden = NO;
  [self.tableView.mj_header endRefreshing];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.newsInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NewsCell *newsCell = [tableView dequeueReusableCellWithIdentifier:NewsCellReuseId forIndexPath:indexPath];
  [newsCell updateCellWithNewsInfo:[self.newsInfos objectAtIndex:indexPath.row]];
  
  return newsCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 100.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  self.newsInfo = [self.newsInfos objectAtIndex:indexPath.row];
  [self showWebView:self.newsInfo];
}

#pragma mark - Private Methods

- (void)showWebView:(NewsInfo *)newsInfo {
  UIWebViewController *webViewController = [UIWebViewController create];
  webViewController.title = self.newsInfo.title;
  webViewController.urlString = self.newsInfo.url;
  
  [self.navigationController pushViewController:webViewController animated:YES];
}

@end
