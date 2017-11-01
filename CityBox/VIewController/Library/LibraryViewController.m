//
//  LibraryViewController.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LibraryViewController.h"
#import "LibraryViewController+Configuration.h"
#import "LibraryViewController+LogicFlow.h"
#import "LibraryCell.h"

@interface LibraryViewController ()

@end

@implementation LibraryViewController

+ (instancetype)create {
  return [LibraryViewController createWithStoryboardName:StoryboardNameHome];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configureView];
}

#pragma mark - Public Methods

- (void)reloadDatas {
  [self.tableView reloadData];
}

#pragma mark - SearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  [self loadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSLog(@"数量:%lu", (unsigned long)self.libraryInfos.count);
  return self.libraryInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  LibraryCell *libraryCell = [tableView dequeueReusableCellWithIdentifier:LibraryCellReuseId forIndexPath:indexPath];
  [libraryCell updateCellWithLibraryInfo:[self.libraryInfos objectAtIndex:indexPath.row]];
  
  return libraryCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 177.f;
}

@end
