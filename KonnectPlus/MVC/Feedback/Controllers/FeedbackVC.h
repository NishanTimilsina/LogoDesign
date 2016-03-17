//
//  FeedbackVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/20/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+WebCache.h"
@interface FeedbackVC : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *subjectTextField;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property(nonatomic,strong)UIToolbar *toolbar;
@property(nonatomic,strong)MBProgressHUD *HUD;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (IBAction)submitBtn:(id)sender;
@end
