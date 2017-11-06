//
//  ProfileViewController.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileViewController+Configuration.h"
#import "UIWebViewController.h"
#import "GroupInfo.h"
#import "UIColor+Utility.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

+ (instancetype)create {
  return [ProfileViewController createWithStoryboardName:StoryboardNameHome];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initProperties];
  [self configureView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *ProfileCellReuseId = @"ProfileCellReuseId";
  
  GroupInfo *groupInfo = [self.groupInfos objectAtIndex:indexPath.section];
  ProfileInfo *profileInfo = [groupInfo.profileInfos objectAtIndex:indexPath.row];
  UITableViewCell *profileCell = [tableView dequeueReusableCellWithIdentifier:ProfileCellReuseId];
  profileCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProfileCellReuseId];
  profileCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  profileCell.textLabel.text = profileInfo.title;
  
  return profileCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 47.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 10.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  UIView *headerView = [[UIView alloc] init];
  headerView.backgroundColor = [UIColor colorWithHexString:@"E5E5E5"];
  
  return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.section) {
    case 1:
      [self showWebView];
      break;
    case 3:
      [self cleanUpForUserDataWithCompletion:nil];
      [BaseViewController resetTabThenSelectedHome];
      break;
      
    default:
      break;
  }
}

#pragma mark - Private Methods

- (void)showWebView {
  UIWebViewController *webViewController = [UIWebViewController create];
  
  [self.navigationController pushViewController:webViewController animated:YES];
}

@end
