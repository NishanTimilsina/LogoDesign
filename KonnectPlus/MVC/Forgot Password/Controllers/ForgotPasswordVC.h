//
//  ForgotPasswordVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/11/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "AppDelegate.h"
@interface ForgotPasswordVC : UIViewController<MBProgressHUDDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailtextfield;
- (IBAction)submit:(id)sender;
@property(nonatomic,strong)UIToolbar *toolbar;
- (IBAction)doneBtntapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property(nonatomic,strong)MBProgressHUD *HUD;
@end
