//
//  ViewController.h
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiService.h"

static NSString *const CanteenCellReuseId = @"CanteenCellReuseId";

@interface CanteenViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource, ApiServiceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *statusView;

@property (nonatomic, strong) NSMutableArray *canteenInfos;

- (void)reloadDatas;

@end

