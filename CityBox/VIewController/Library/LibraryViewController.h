//
//  LibraryViewController.h
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiService.h"

static NSString *const LibraryCellReuseId = @"LibraryCellReuseId";

@interface LibraryViewController : BaseViewController <ApiServiceDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *libraryInfos;

- (void)reloadDatas;

@end
