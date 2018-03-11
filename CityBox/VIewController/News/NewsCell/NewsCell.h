//
//  NewsCell.h
//  CityBox
//
//  Created by 郭枫 on 2018/3/1.
//  Copyright © 2018年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsInfo.h"

@interface NewsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;

@property (nonatomic, strong) NewsInfo *newsInfo;

- (void) updateCellWithNewsInfo:(NewsInfo *)newsInfo;

@end
