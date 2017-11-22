//
//  ProfileCell.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/22.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileInfo.h"

@interface ProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) ProfileInfo *profileInfo;

- (void) updateCellWithProfileInfo:(ProfileInfo *)profileInfo;

@end
