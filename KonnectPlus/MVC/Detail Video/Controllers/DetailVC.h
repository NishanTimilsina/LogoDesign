//
//  DetailVC.h
//  KonnectPlus
//
//  Created by One Platinum on 12/12/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "DetailDataModel.h"
#import "detailcell.h"
#import "relatedMediaDataModel.h"
#import "UIImageView+WebCache.h"
#import <MediaPlayer/MediaPlayer.h>
#import "ServerURl.h"

@protocol updateMainVCDelegate <NSObject>

-(void)updateVC;
@end
@interface DetailVC : UIViewController<MBProgressHUDDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)NSString *media_id;
@property(nonatomic,strong)NSString *paymentStatus;
@property(nonatomic,strong)NSString *PIN;
@property(nonatomic,strong)NSString *caption_URL;

@property(nonatomic,strong)MBProgressHUD *HUD;
@property(nonatomic,strong)NSMutableArray *myArray;
@property(nonatomic,strong)NSMutableArray *mytableArray;
@property(retain)MPMoviePlayerController *moviePlayer;
@property (nonatomic,weak)id<updateMainVCDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *classification;
@property (weak, nonatomic) IBOutlet UILabel *FilmTitle;
@property (weak, nonatomic) IBOutlet UILabel *filmDes;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UITableView *mytable;
@property (weak, nonatomic) IBOutlet UIImageView *tableImageview;
- (IBAction)playVideoBtnTapped:(id)sender;
@property(nonatomic) NSTimeInterval currentPlaybackTime;

@end
