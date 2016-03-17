//
//  MenuVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/26/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "sidebarDataModel.h"
#import "sidebarCell.h"
#import "DetailVC.h"
#import "MainDataModel.h"
#import "MainVC.h"
#import "sidebarDataModel.h"
#import "UISidebarViewController.h"
#import "AppDelegate.h"
#import "UISidebarViewController.h"


@protocol pushViewToNavigationDelegate<NSObject>
@optional

-(void)pushView:(UIViewController *)view;

@end

@interface MenuVC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *topItems;
    NSMutableArray *subItems; // array of arrays
    
    int currentExpandedIndex;
}
@property (nonatomic,weak)id<pushViewToNavigationDelegate>delegate;
@property(nonatomic,strong)UISidebarViewController *viewcontroller;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)MBProgressHUD *HUD;
@property(nonatomic,strong)NSMutableArray *PortofolioVCArray;
@property(nonatomic,strong)NSMutableArray *testArray;
@end
