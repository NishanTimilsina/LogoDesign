//
//  MainVC.m
//  KonnectPlus
//
//  Created by One Platinum on 11/24/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "MainVC.h"
#import "UIImageView+WebCache.h"
#import "ProfileVC.h"

@interface MainVC ()
@property(nonatomic,strong)UIActivityIndicatorView *activityIndicator;
@end

@implementation MainVC
@synthesize HUD,myArray,activityIndicator;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self setupMenu];

    [self setTitle: @""];
    [self.activity setHidden:YES];


    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 33, 44)];
    button.tintColor=[UIColor whiteColor];
    [button setImage:[UIImage imageNamed:@"ico_smallMenu.png"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(SettingBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:item animated:YES];
    myArray=[[NSMutableArray alloc]init];
    
    
    
    if(self.isFromSideMenu==YES){
        
        [self setupMenu];
        
        [self downLoadListWithID:self.media_id];
    }
    else{
        [self setupMenu];
    [self downLoadList];
    }
    self.Mytable.delegate=self;
    self.Mytable.dataSource=self;
    self.title=@"";
   ;
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    tapBackground.cancelsTouchesInView = NO;
    
  
}
-(void) dismissKeyboard:(id)sender
{
    [self.Mytable setHidden:NO];

    [self.searchBar resignFirstResponder];

    [self.view endEditing:YES];
}
-(void)setupMenu{
    
    SWRevealViewController *revealController = [self revealViewController];
    
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"ico_nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 10, 33, 44)];
    button1.tintColor=[UIColor whiteColor];
    [button1 setImage:[UIImage imageNamed:@"ico_menu.png"] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
    [self.navigationItem setLeftBarButtonItem:item1 animated:YES];
    
}



-(void)SettingBtnTapped{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select setting option:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Profile",
                            @"FeedBack",
                            @"Contact",
                            @"Setting",
                            @"Log Out",
                            nil];
    popup.tag = 1;
      [popup showInView:self.view];


}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIStoryboard *sb;
    
    if(IS_IPAD){
        sb = [UIStoryboard storyboardWithName:@"ipad" bundle:nil];
        
    }
    else if(IS_IPHONE){
        sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:{
                    ProfileVC *p=[[ProfileVC alloc]init];
                    p=[sb instantiateViewControllerWithIdentifier:@"PROFILEVC"];
                    [self.navigationController pushViewController:p animated:YES];
                }
                    break;
                case 1:
                {
                    FeedbackVC *ct=[[FeedbackVC alloc]init];
                    ct=[sb instantiateViewControllerWithIdentifier:@"FEEDBACKVC"];
                    [self.navigationController pushViewController:ct animated:YES];
                }
                    break;
                case 2:{
                    ContactVC *ct=[[ContactVC alloc]init];
                    ct=[sb instantiateViewControllerWithIdentifier:@"CONTACTVC"];
                    [self.navigationController pushViewController:ct animated:YES];
                }
                    break;
                case 3:
                {
                    Setting *ct=[[Setting alloc]init];
                    ct=[sb instantiateViewControllerWithIdentifier:@"SETTINGVC"];
                    [self.navigationController pushViewController:ct animated:YES];
                }

                    break;
                case 4:
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert!" message:@"Are you sure want to Log out ?" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
                    [alert show];
                }
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        [self Logout];
    }
}
-(void)Logout{
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
//[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user_id"];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"status"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
//    NSDictionary * dict = [defs dictionaryRepresentation];
//    for (id key in dict) {
//        [defs removeObjectForKey:key];
//    }
//    [defs synchronize];
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    UIStoryboard *sb;
    LoginVC *login=[[LoginVC alloc]init];
    if(IS_IPAD){
        sb = [UIStoryboard storyboardWithName:@"ipad" bundle:nil];
        
    }
    else if(IS_IPHONE){
        sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    [self addActivity];
    NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/deviceunlink?user_id=%@&device_serial_no=%@&token=%@",userID,[[[UIDevice currentDevice] identifierForVendor] UUIDString],token];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:url parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [self removeActivity];
        if([[responseObject valueForKey:@"status"] isEqualToString:@"false"]){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:[responseObject valueForKey:@"error"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
        }
        else{
            NSLog(@"succecss");
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user_id"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"status"] ;
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            
            [appDelegate LoginView];

            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        [self removeActivity];
        
        
    }];
    [manager.operationQueue addOperation:operation];

  
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)searchDataDownload:(NSString*)keyword{
    [self addActivity];
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];

   // NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/search?user_id=%@&param=%@&token=%@",userID,keyword,token];
    //url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:url parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        if([[responseObject valueForKey:@"status"] isEqualToString:@"false"]){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:[responseObject valueForKey:@"error"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
        }
        else{
            
            
            NSArray *medialist=[responseObject valueForKey:@"medialist"];
            
            
            
            
            // NSMutableArray *deal=[[NSMutableArray alloc]init];
            NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < [medialist count]; i++)
            {
                
                DealsVCDictionary = [medialist objectAtIndex:i];
                
                MainDataModel *dealsDataModel = [[MainDataModel alloc] init];
                dealsDataModel.title=[ DealsVCDictionary valueForKey:@"title"];
                dealsDataModel.largeimage_url=[DealsVCDictionary valueForKey:@"smallimage"];
                dealsDataModel.classification=[DealsVCDictionary valueForKey:@"classification"];
                dealsDataModel.media_id=[DealsVCDictionary valueForKey:@"media_id"];
                dealsDataModel.time=[DealsVCDictionary valueForKey:@"length"];
                dealsDataModel.paymentstatusl=[DealsVCDictionary valueForKey:@"paymentstatus"];

                [dealsDataArray addObject:dealsDataModel];
                
            }
            [myArray addObjectsFromArray:dealsDataArray];
            
            
            
            
            
            
            
            
            [self.Mytable reloadData];
            [self.Mytable reloadInputViews];
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    

}
-(void)downLoadListWithID:(NSString*)mediaID{
    [self addActivity];
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    
    NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/subcategorylist?user_id=%@&subcatid=%@&token=%@",userID,self.subCatID,token];
    //url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:url parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        if([[responseObject valueForKey:@"status"] isEqualToString:@"false"]){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:[responseObject valueForKey:@"error"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
        }
        else{
            
            
            NSArray *medialist=[responseObject valueForKey:@"medialist"];
            
            
            
            
            // NSMutableArray *deal=[[NSMutableArray alloc]init];
            NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < [medialist count]; i++)
            {
                
                DealsVCDictionary = [medialist objectAtIndex:i];
                
                MainDataModel *dealsDataModel = [[MainDataModel alloc] init];
                dealsDataModel.title=[ DealsVCDictionary valueForKey:@"title"];
                dealsDataModel.largeimage_url=[DealsVCDictionary valueForKey:@"smallimage"];
                dealsDataModel.classification=[DealsVCDictionary valueForKey:@"classification"];
                dealsDataModel.media_id=[DealsVCDictionary valueForKey:@"media_id"];
                dealsDataModel.time=[DealsVCDictionary valueForKey:@"length"];
                dealsDataModel.paymentstatusl=[DealsVCDictionary valueForKey:@"paymentstatus"];
                [dealsDataArray addObject:dealsDataModel];
                
            }
            [myArray addObjectsFromArray:dealsDataArray];
            
            
            
            
            
            
            
            
            [self.Mytable reloadData];
            [self.Mytable reloadInputViews];
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        [self removeActivity];

    }];
    
    [manager.operationQueue addOperation:operation];

}
-(void)downLoadList{
    [self addActivity];
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];

    NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/subcategorylist?user_id=%@&subcatid=%@&token=%@",userID,@"36",token];
    //url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:url parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        if([[responseObject valueForKey:@"status"] isEqualToString:@"false"]){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:[responseObject valueForKey:@"error"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
        }
        else{
            
            
            NSArray *medialist=[responseObject valueForKey:@"medialist"];
            

            
            
           // NSMutableArray *deal=[[NSMutableArray alloc]init];
            NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < [medialist count]; i++)
            {
                
                DealsVCDictionary = [medialist objectAtIndex:i];
                
                MainDataModel *dealsDataModel = [[MainDataModel alloc] init];
                dealsDataModel.title=[ DealsVCDictionary valueForKey:@"title"];
                dealsDataModel.largeimage_url=[DealsVCDictionary valueForKey:@"smallimage"];
                dealsDataModel.classification=[DealsVCDictionary valueForKey:@"classification"];
                dealsDataModel.media_id=[DealsVCDictionary valueForKey:@"media_id"];
                dealsDataModel.time=[DealsVCDictionary valueForKey:@"length"];
                dealsDataModel.paymentstatusl=[DealsVCDictionary valueForKey:@"paymentstatus"];
                [dealsDataArray addObject:dealsDataModel];
                
            }
            [myArray addObjectsFromArray:dealsDataArray];

            
            
            
            
            
            
            
            [self.Mytable reloadData];
            [self.Mytable reloadInputViews];
            [self removeActivity];

            
                   }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];

    [manager.operationQueue addOperation:operation];
    
}

-(void)searchMovieWithName:(NSString*)txt{
    
    
  

    
   // [self addActivity];
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];

   // NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/search?user_id=%@&param=%@&token=%@",userID,txt,token];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:url parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        if([[responseObject valueForKey:@"status"] isEqualToString:@"false"]){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:[responseObject valueForKey:@"msg"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
           // [alert show];
        }
        else{
            
            
            NSArray *medialist=[responseObject valueForKey:@"results"];
            
            
            
            
            // NSMutableArray *deal=[[NSMutableArray alloc]init];
            NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < [medialist count]; i++)
            {
                
                DealsVCDictionary = [medialist objectAtIndex:i];
                
                MainDataModel *dealsDataModel = [[MainDataModel alloc] init];
                dealsDataModel.title=[ DealsVCDictionary valueForKey:@"title"];
                dealsDataModel.largeimage_url=[DealsVCDictionary valueForKey:@"smallimage"];
                dealsDataModel.classification=[DealsVCDictionary valueForKey:@"classification"];
                dealsDataModel.media_id=[DealsVCDictionary valueForKey:@"media_id"];
                dealsDataModel.time=[DealsVCDictionary valueForKey:@"length"];
                [dealsDataArray addObject:dealsDataModel];
                
            }
            [myArray addObjectsFromArray:dealsDataArray];
            [self.searchDisplayController.searchResultsTableView reloadData];
            [self.searchBar resignFirstResponder];
            [self.Mytable setHidden:NO];
            [self.activity stopAnimating];
            [self.activity setHidden:YES];


            
            
            
            
            
            
            
            [self.Mytable reloadData];
            [self.Mytable reloadInputViews];
         //   [self removeActivity];
            [self.activity stopAnimating];
            [self.activity setHidden:YES];
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    

    
}
#pragma mark TableView Delegates

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return [self.searchArray count];
//    }
//        {
    return [myArray count];
       // }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"MainCell";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        // More initializations if needed.
    }
    cell.backgroundColor=[UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
      MainDataModel *model;
    if(!myArray.count==0)
    {
  
    model= [myArray objectAtIndex:indexPath.row];
    }
    
    NSString *time=[self timeFormatted:[model.time integerValue] ];
                                        
                    
    cell.timeLabel.text=time;
    cell.slug.text=[NSString stringWithFormat:@"%@ | 2014 ",[model classification]];
    cell.mytitle.text=[model title];
    NSString *url=[model largeimage_url];
    
   // [cell.myimage setImageWithURL:[NSURL URLWithString:url]
   //              placeholderImage:[UIImage imageNamed:@"location.png"]];
  //  NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
  //  [cell.myimage initWithImage:[UIImage imageWithData: imageData]];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    
    dispatch_async(queue, ^{
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            //Set the image to image view not, wither cell.imageview or [cell add subviw:imageview later ]
            [cell.myimage initWithImage:[UIImage imageWithData:imageData]];
            [cell.myimage setNeedsLayout];
        });
    });
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [activityIndicator stopAnimating];
    [activityIndicator setHidden:YES];

    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainDataModel *model=[myArray objectAtIndex:indexPath.row];
    DetailVC *detail=[[DetailVC alloc]init];
    UIStoryboard *sb;
    
    if(IS_IPAD){
        sb = [UIStoryboard storyboardWithName:@"ipad" bundle:nil];
        
    }
    else if(IS_IPHONE){
        sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    
    detail = [sb instantiateViewControllerWithIdentifier:@"DETAILID"];
    
    NSLog(@"status:%@",[model paymentstatusl]);
    
    detail.paymentStatus=[model paymentstatusl];
    detail.media_id=[model media_id];
    //detail.title=[model title];
    detail.delegate=self;
    [self.navigationController pushViewController:detail animated:YES];



    
}

-(void)updateVC{
    myArray=[[NSMutableArray alloc]init];
    [self downLoadList];
}
-(void)addActivity{
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    //  HUD.color=[UIColor redColor];
    HUD.labelText = @"Loding...";
    self.view.userInteractionEnabled=FALSE;
    //HUD.c
    [HUD show:YES];
}
-(void)removeActivity{
    
    self.view.userInteractionEnabled=TRUE;
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (NSString *)timeFormatted:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    NSString *timeString =@"";
    NSString *formatString=@"";
    if(hours > 0){
        formatString=hours==1?@"%d hour":@"%d:";
        timeString = [timeString stringByAppendingString:[NSString stringWithFormat:formatString,hours]];
    }
    if(minutes > 0 || hours > 0 ){
        formatString=minutes==1?@" %d minute":@"%d:";
        timeString = [timeString stringByAppendingString:[NSString stringWithFormat:formatString,minutes]];
    }
    if(seconds > 0 || hours > 0 || minutes > 0){
        formatString=seconds==1?@" %d second":@"%d";
        timeString  = [timeString stringByAppendingString:[NSString stringWithFormat:formatString,seconds]];
    }
    return timeString;
    
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self.Mytable setHidden:YES];
    [self.myArray removeAllObjects];

    return YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    NSString *str = searchBar.text;
    
    [self.activity setHidden:NO];
    [self.activity startAnimating];
    [self searchMovieWithName:str];
    
    //Create and add the Activity Indicator to splashView
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    // activityIndicator.center = CGPointMake(160, 360);
    
    activityIndicator.frame=CGRectMake(400, 400, 160, 360);
    // activityIndicator.hidesWhenStopped = NO;
    [activityIndicator startAnimating];
    
    [self.view addSubview:activityIndicator];
    
    
    if([str length] == 0) {
        [self.searchBar resignFirstResponder];
    }
    
}
/*
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText

{
    
    [self.activity setHidden:NO];
    [self.activity startAnimating];
    [self searchMovieWithName:searchText];
    
    
    
    //Create and add the Activity Indicator to splashView
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
   // activityIndicator.center = CGPointMake(160, 360);
    
    activityIndicator.frame=CGRectMake(400, 400, 160, 360);
   // activityIndicator.hidesWhenStopped = NO;
    [activityIndicator startAnimating];
    
    [self.view addSubview:activityIndicator];
    
    
    if([searchText length] == 0) {
        [self.searchBar resignFirstResponder];
    }
}
*/
//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
//{
//    // Tells the table data source to reload when text changes
//   /* [self filterContentForSearchText:searchString scope:
//     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
//    */
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}
//
//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
//
//    // Tells the table data source to reload when scope bar selection changes
//   /* [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
//     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
//    */
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchBar resignFirstResponder];
   // [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.Mytable setHidden:NO];
    // [_detailSegment setUserInteractionEnabled:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    // AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    // [delegate popToFeedView];
}
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
//{
//    //    self.hashTagTable.hidden = YES;
//    [self.searchResultsArray removeAllObjects];
//    self.search_flag = YES;
//    return YES;
//}
//
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    NSLog(@"log text is : %@",searchText);
//    self.search_flag = YES;
//    
//    [self.searchController getSearchListItems:searchText];
//}
//
//- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
//{
//    //    self.hashTagTable.hidden = NO;
//    self.search_flag = NO;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
