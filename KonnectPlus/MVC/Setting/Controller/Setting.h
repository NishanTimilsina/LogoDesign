//
//  Setting.h
//  KonnectPlus
//
//  Created by One Platinum on 12/20/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Setting : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property(nonatomic,strong)NSArray *list;
@end
