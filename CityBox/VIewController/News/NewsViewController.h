//
//  NewsViewController.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsInfo.h"
#import "ApiService.h"

static NSString *const NewsCellReuseId = @"NewsCellReuseId";


@interface NewsViewController : BaseViewController <ApiServiceDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NewsInfo *newsInfo;

@property (nonatomic, strong) NSMutableArray *newsInfos;

- (void)reloadDatas;
- (void)loadNewDatas;
- (void)stopRefresh;

@end
