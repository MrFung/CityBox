//
//  TableViewCell.h
//  test
//
//  Created by 郭枫 on 2017/9/30.
//  Copyright © 2017年 郭枫. All rights reserved.
//an

#import <UIKit/UIKit.h>
#import "CanteenInfo.h"

@interface CanteenCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *menuId;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *floor;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *telephone;

@property (nonatomic, strong) CanteenInfo *canteenInfo;

- (void) updateCellWithCanteenInfo:(CanteenInfo *)canteenInfo;

@end
