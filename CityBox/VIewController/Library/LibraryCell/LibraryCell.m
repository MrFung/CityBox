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
  self.bookAuther.text = [NSString stringWithFormat:@"作者: %@", self.libraryInfo.bookAuther];
  self.bookPress.text = [NSString stringWithFormat:@"出版社: %@", self.libraryInfo.bookPress];
  self.bookPlace.text = [NSString stringWithFormat:@"位置: %@", self.libraryInfo.bookPlace];
  self.bookStatus.text = [NSString stringWithFormat:@"状态: %@", self.libraryInfo.bookStatus];
}

@end
