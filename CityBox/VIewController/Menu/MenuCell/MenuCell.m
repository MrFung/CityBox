//
//  MenuCell.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public Methods

- (void)updateCellWithMenuInfo:(MenuInfo *)menuInfo {
  self.menuInfo = menuInfo;
  [self reloadData];
}

#pragma mark - Private Methods

- (void)reloadData {
  self.foodName.text = self.menuInfo.foodName;
  self.foodPrice.text = [NSString stringWithFormat:@"价格: %@", self.menuInfo.foodPrice];
}

@end
