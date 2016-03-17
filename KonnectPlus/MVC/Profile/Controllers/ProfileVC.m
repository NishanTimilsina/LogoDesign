//
//  ProfileVC.m
//  KonnectPlus
//
//  Created by One Platinum on 12/20/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "ProfileVC.h"

@interface ProfileVC ()

@end

@implementation ProfileVC
@synthesize HUD;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadProfile];
   // self.navigationController.navigationBar.topItem.title = @"Profile";

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)downloadProfile{
    [self addActivity];
    //   NSDictionary *postParams;
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/userinfo?user_id=%@&token=%@",userID,token];
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:[responseObject valueForKey:@"error"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
            [self removeActivity];
            
        }
        else{
            
            
            NSDictionary *info=[responseObject valueForKey:@"customerInfo"];
            self.nameLb.text=[info valueForKey:@"name"];
            self.emailLb.text=[info valueForKey:@"emailId"];
            self.balanceLb.text=[info valueForKey:@"prepaid_balance"];
            self.pakagenameLb.text=[info valueForKey:@"package_name"];
            self.expiryLb.text=[info valueForKey:@"package_expiry_date"];
            [self removeActivity];
            
            
            
                  }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    // [self removeActivity];

    
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

@end
