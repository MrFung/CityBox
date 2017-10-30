//
//  LoginViewController.h
//  test
//
//  Created by 郭枫 on 2017/10/20.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiService.h"

@interface LoginViewController : BaseViewController <UITextFieldDelegate, ApiServiceDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
