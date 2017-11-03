//
//  MenuViewController.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiService.h"

static NSString *const MenuCellReuseId = @"MenuCellReuseId";

@interface MenuViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, ApiServiceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *menuInfos;

- (void)reloadDatas;

@end
