//
//  ProfileVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/20/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+WebCache.h"

@interface ProfileVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *emailLb;
@property (weak, nonatomic) IBOutlet UILabel *balanceLb;
@property (weak, nonatomic) IBOutlet UILabel *pakagenameLb;
@property (weak, nonatomic) IBOutlet UILabel *expiryLb;
@property(nonatomic,strong)MBProgressHUD *HUD;
@end
