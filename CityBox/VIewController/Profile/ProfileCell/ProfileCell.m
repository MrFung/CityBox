//
//  ProfileCell.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/22.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ProfileCell.h"

@implementation ProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public Methods

- (void)updateCellWithProfileInfo:(ProfileInfo *)profileInfo {
  self.profileInfo = profileInfo;
  [self reloadData];
}

#pragma mark - Private Methods

- (void)reloadData {
  self.titleLabel.text = self.profileInfo.title;
}

@end
