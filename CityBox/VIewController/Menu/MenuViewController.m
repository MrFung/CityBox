//
//  MenuViewController.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuViewController+Configuration.h"
#import "MenuViewController+LogicFlow.h"
#import "MenuCell.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

+ (instancetype)create {
  return [MenuViewController createWithStoryboardName:StoryboardNameHome];
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

#pragma mark - IBAction Methods

- (IBAction)backClicked:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Public Methods

- (void)reloadDatas {
  [self.tableView reloadData];
}

- (void)idForMenu:(NSInteger)row {
  self.menuId = row;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSLog(@"数量:%lu", (unsigned long)self.menuInfos.count);
  return self.menuInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MenuCell *menuCell = [tableView dequeueReusableCellWithIdentifier:MenuCellReuseId forIndexPath:indexPath];
  [menuCell updateCellWithMenuInfo:[self.menuInfos objectAtIndex:indexPath.row]];
  
  return menuCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 47;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
