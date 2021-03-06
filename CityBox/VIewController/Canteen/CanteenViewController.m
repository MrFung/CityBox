//
//  ViewController.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CanteenViewController.h"
#import "CanteenViewController+Configuration.h"
#import "CanteenViewController+LogicFlow.h"
#import "MenuViewController.h"
#import "CanteenCell.h"
#import "UIView+FrameMethods.h"
#import "IphoneType.h"

@interface CanteenViewController ()

@end

@implementation CanteenViewController

+ (instancetype)create {
  return [CanteenViewController createWithStoryboardName:StoryboardNameHome];
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
  [self.tableView.mj_header endRefreshing];
  self.tableView.mj_header.hidden = NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSLog(@"数量:%lu", (unsigned long)self.canteenInfos.count);
  return self.canteenInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  CanteenCell *canteenCell = [tableView dequeueReusableCellWithIdentifier:CanteenCellReuseId forIndexPath:indexPath];
  [canteenCell updateCellWithCanteenInfo:[self.canteenInfos objectAtIndex:indexPath.row]];
   
   return canteenCell;
}
   
#pragma mark - UITableViewDelegate
 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 177.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self showMenuView:indexPath];
}

#pragma mark - Private Methods

- (void)showMenuView:(NSIndexPath *)indexPath {
  MenuViewController *menuViewController = [MenuViewController create];
  [menuViewController idForMenu:indexPath.row + 1];
  [self.navigationController pushViewController:menuViewController animated:YES];
}

@end
