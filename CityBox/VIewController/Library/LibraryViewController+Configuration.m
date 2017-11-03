//
//  LibraryViewController+Configuration.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LibraryViewController+Configuration.h"

@implementation LibraryViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
  self.libraryInfos = [NSMutableArray array];
}

- (void)configureView {
  [self configureViewEdges];
  [self configureTableVIew];
  [self configureSearchBar];
}

#pragma mark - Private Methods

- (void)configureViewEdges {
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.tabBarController.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)configureTableVIew {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"LibraryCell" bundle:nil] forCellReuseIdentifier:LibraryCellReuseId];
}

- (void)configureSearchBar {
  self.searchBar.delegate = self;
}

@end
