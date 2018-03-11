//
//  CanteenViewController+Configuration.m
//  test
//
//  Created by 郭枫 on 2017/9/29.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CanteenViewController+Configuration.h"

@implementation CanteenViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
  self.canteenInfos = [NSMutableArray array];
}

- (void)configureView {
  [self configureViewEdges];
  [self configureTableVIew];
}

#pragma mark - Private Methods

- (void)configureViewEdges {
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.tabBarController.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)configureTableVIew {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"CanteenCell" bundle:nil] forCellReuseIdentifier:CanteenCellReuseId];
  
  self.tableView.mj_header = [self configureHeaderRefreshWithTarget:self refreshingAction:@selector(loadNewDatas)];
}

@end
