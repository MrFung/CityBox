//
//  MenuCell.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/3.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuInfo.h"

@interface MenuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodPrice;

@property (nonatomic, strong) MenuInfo *menuInfo;

- (void) updateCellWithMenuInfo:(MenuInfo *)menuInfo;

@end
