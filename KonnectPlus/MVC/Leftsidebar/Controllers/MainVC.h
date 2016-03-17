//
//  MainVC.h
//  KonnectPlus
//
//  Created by One Platinum on 11/24/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "ServerURl.h"
#import "MainCell.h"
#import "MainDataModel.h"
#import "UIImageView+WebCache.h"
#import "AFHTTPRequestOperationManager.h"
#import "DetailVC.h"
#import "UISidebarViewController.h"
#import "ProfileVC.h"
#import "ContactVC.h"
#import "FeedbackVC.h"
#import "Setting.h"
#import "AppDelegate.h"
#import "MenuVC.h"


@interface MainVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate,UIActionSheetDelegate,updateMainVCDelegate>
@property (weak, nonatomic) IBOutlet UITableView *Mytable;
@property(nonatomic,strong)MBProgressHUD *HUD;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
- (IBAction)doneBtn:(id)sender;
@property(nonatomic,strong)NSMutableArray *myArray;
@property(nonatomic,strong)NSMutableArray *searchArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(nonatomic,strong)UISidebarViewController *viewcontroller;
@property(nonatomic,strong)NSString *media_id;
@property(nonatomic,strong)NSString *subCatID;
@property (nonatomic, assign) UISidebarViewControllerDirection direction;

@property BOOL isFromSideMenu;

@end
