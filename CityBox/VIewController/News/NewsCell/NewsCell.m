//
//  NewsCell.m
//  CityBox
//
//  Created by 郭枫 on 2018/3/1.
//  Copyright © 2018年 郭枫. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public Methods

- (void)updateCellWithNewsInfo:(NewsInfo *)newsInfo {
  self.newsInfo = newsInfo;
  [self reloadData];
}

#pragma  mark - Private Methods

- (void)reloadData {
  self.title.text = self.newsInfo.title;
  self.author.text = self.newsInfo.author;
  self.time.text = self.newsInfo.time;
  [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:self.newsInfo.picture] placeholderImage:[UIImage imageNamed:@"company_default"]];
}

@end
