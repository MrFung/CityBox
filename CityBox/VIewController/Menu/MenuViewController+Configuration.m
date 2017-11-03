//
//  MenuViewController+Configuration.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "MenuViewController+Configuration.h"

@implementation MenuViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
  self.menuInfos = [NSMutableArray array];
}

- (void)configureView {
  [self configureTableVIew];
}

#pragma mark - Private Methods

- (void)configureTableVIew {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellReuseIdentifier:MenuCellReuseId];
}

@end
