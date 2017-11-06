//
//  ProfileViewController.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "profileInfo.h"

@interface ProfileViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) ProfileInfo *profileInfo;

@property (nonatomic, strong) NSMutableArray *groupInfos;

@end
