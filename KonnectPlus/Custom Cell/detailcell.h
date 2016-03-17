//
//  detailcell.h
//  KonnectPlus
//
//  Created by One Platinum on 12/17/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailcell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *titlename;
@property (weak, nonatomic) IBOutlet UILabel *classification_name;
@property (weak, nonatomic) IBOutlet UIImageView *tableimageview;

@end
