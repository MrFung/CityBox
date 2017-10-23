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

@property (strong, nonatomic) CanteenInfo *canteenInfo;

@property (weak, nonatomic) IBOutlet UILabel *_id;
@property (weak, nonatomic) IBOutlet UILabel *_location;
@property (weak, nonatomic) IBOutlet UILabel *_floor;
@property (weak, nonatomic) IBOutlet UILabel *_name;
@property (weak, nonatomic) IBOutlet UILabel *_telephone;

- (void) updateCellWithCanteenInfo:(CanteenInfo *)canteenInfo;

@end
