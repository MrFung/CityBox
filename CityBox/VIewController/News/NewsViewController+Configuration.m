//
//  NewsViewController+Configuration.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "NewsViewController+Configuration.h"

@implementation NewsViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
  self.newsInfos = [NSMutableArray array];
}

- (void)configureView {
  [self configureViewEdges];
  [self configureTableView];
}

#pragma mark - Private Methods

- (void)configureViewEdges {
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.tabBarController.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)configureTableView {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:NewsCellReuseId];
  
  self.tableView.mj_header = [self configureHeaderRefreshWithTarget:self refreshingAction:@selector(loadNewDatas)];
}

@end
