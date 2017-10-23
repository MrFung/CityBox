//
//  TableViewCell.m
//  test
//
//  Created by 郭枫 on 2017/9/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "CanteenCell.h"

@implementation CanteenCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public Methods

- (void)updateCellWithCanteenInfo:(CanteenInfo *)canteenInfo {
  self.canteenInfo = canteenInfo;
  [self reloadData];
}

#pragma mark - Private Methods

- (void)reloadData {
  self.menuId.text = self.canteenInfo.menuId;
  self.location.text = self.canteenInfo.location;
  self.floor.text = self.canteenInfo.floor;
  self.name.text = self.canteenInfo.name;
  self.telephone.text = self.canteenInfo.telephone;
}

@end
