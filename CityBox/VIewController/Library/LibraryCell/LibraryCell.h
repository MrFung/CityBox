//
//  TableViewCell.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/1.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibraryInfo.h"

@interface LibraryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookAuther;
@property (weak, nonatomic) IBOutlet UILabel *bookPress;
@property (weak, nonatomic) IBOutlet UILabel *bookPlace;
@property (weak, nonatomic) IBOutlet UILabel *bookStatus;

@property (nonatomic, strong) LibraryInfo *libraryInfo;

- (void) updateCellWithLibraryInfo:(LibraryInfo *)libraryInfo;

@end
