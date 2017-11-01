//
//  TableViewCell.m
//  CityBox
//
//  Created by 郭枫 on 2017/11/1.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "LibraryCell.h"

@implementation LibraryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public Methods

- (void)updateCellWithLibraryInfo:(LibraryInfo *)libraryInfo {
  self.libraryInfo = libraryInfo;
  [self reloadData];
}

#pragma mark - Private Methods

- (void)reloadData {
  self.bookName.text = self.libraryInfo.bookName;
  self.bookAuther.text = self.libraryInfo.bookAuther;
  self.bookPress.text = self.libraryInfo.bookPress;
  self.bookPlace.text = self.libraryInfo.bookPlace;
  self.bookStatus.text = self.libraryInfo.bookStatus;
}

@end
