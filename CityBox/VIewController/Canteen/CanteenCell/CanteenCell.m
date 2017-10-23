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
  self._id.text = self.canteenInfo._id;
  self._location.text = self.canteenInfo._location;
  self._floor.text = self.canteenInfo._floor;
  self._name.text = self.canteenInfo._name;
  self._telephone.text = self.canteenInfo._telephone;
}

@end
