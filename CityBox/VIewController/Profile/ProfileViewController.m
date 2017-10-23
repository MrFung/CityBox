//
//  ProfileViewController.m
//  CityBox
//
//  Created by 郭枫 on 2017/10/23.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

+ (instancetype)create {
  return [ProfileViewController createWithStoryboardName:StoryboardNameHome];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
