//
//  LoginVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/9/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TasDealAPI.h"
#import "ServerURl.h"
#import "MBProgressHUD.h"
#import "ForgotPasswordVC.h"
#import "AppDelegate.h"
#import <sys/sysctl.h>
@interface LoginVC : UIViewController<UITextFieldDelegate,MBProgressHUDDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailtextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordtextfield;
@property (weak, nonatomic) IBOutlet UITextField *deviceNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *deviceSerialTextField;
@property (weak, nonatomic) IBOutlet UITextField *appVersionTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property(nonatomic,strong)UIToolbar *toolbar;
@property(nonatomic,strong)MBProgressHUD *HUD;
- (IBAction)forgotPassBtn:(id)sender;

- (IBAction)submitBtntapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *deviceModelTextField;
@property(nonatomic,strong)NSString *device_name;
@property(nonatomic,strong)NSString *device_serial;
@property(nonatomic,strong)NSString *device_model;
@property(nonatomic,strong)NSString *app_version;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end
