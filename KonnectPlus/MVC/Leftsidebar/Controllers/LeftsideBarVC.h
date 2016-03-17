//
//  LeftsideBarVC.h
//  KonnectPlus
//
//  Created by One Platinum on 11/24/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftCell.h"
#import "sidebarDataModel.h"

@interface LeftsideBarVC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
  
     // array of arrays
    
    int currentExpandedIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *subItems;
@property(nonatomic,strong) NSMutableArray *topItems;

@end
