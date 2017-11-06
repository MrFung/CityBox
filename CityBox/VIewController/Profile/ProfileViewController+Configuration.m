//
//  ProfileViewController+Configuration.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ProfileViewController+Configuration.h"
#import "GroupInfo.h"

@implementation ProfileViewController (Configuration)

#pragma mark - Public Methods

- (void)initProperties {
  self.groupInfos = [NSMutableArray array];
  [self initData];
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
}

- (void)initData {
  NSArray *profileDatas = @[@{
                              @"profileInfos" : @[@{
                                                    @"title" : @"成绩查询"
                                                    }]
                              }, @{
                              @"profileInfos" : @[@{
                                                    @"title" : @"学校全景"
                                                    }]
                              }, @{
                              @"profileInfos" : @[@{
                                                    @"title" : @"关于我们"
                                                    }]
                              }, @{
                              @"profileInfos" : @[@{
                                                    @"title" : @"退出登录"
                                                    }]
                              }];
  
  for (NSDictionary *profileData in profileDatas) {
    GroupInfo *groupInfo = [GroupInfo groupInfoWithData:profileData];
    [self.groupInfos addObject:groupInfo];
  }
}

@end
