//
//  sidebarVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/3/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "sidebarDataModel.h"
#import "sidebarCell.h"
#import "DetailVC.h"

@interface sidebarVC : UITableViewController{
    NSMutableArray *topItems;
    NSMutableArray *subItems; // array of arrays
    
    int currentExpandedIndex;
}
@property(nonatomic,strong)MBProgressHUD *HUD;
@property(nonatomic,strong)NSMutableArray *PortofolioVCArray;
@property(nonatomic,strong)NSMutableArray *testArray;

@end
