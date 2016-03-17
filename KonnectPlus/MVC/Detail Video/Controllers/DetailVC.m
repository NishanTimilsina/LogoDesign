//
//  DetailVC.m
//  KonnectPlus
//
//  Created by One Platinum on 12/12/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property(nonatomic, assign) int times;
@end

@implementation DetailVC
@synthesize HUD,media_id,myArray,mytableArray,tableImageview,moviePlayer,times;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.paymentStatus);
    
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width, 1500);
   // self.navigationController.navigationBar.topItem.title = @"Back";

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    myArray=[[NSMutableArray alloc]init];
    mytableArray=[[NSMutableArray alloc]init];
    self.mytable.delegate=self;
    self.mytable.dataSource=self;
    _scrollview.hidden=YES;
    [self downLoadList];
    [self tableDataDownload];

    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)downloadVideoURL:(NSString*)PIN{
    
    [self addActivity];
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    
    //   NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/payment?media_id=%@&user_id=%@&token=%@&pin_no=%@",media_id,userID,token,PIN];
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
            [alert show];
            [self removeActivity];

        }
        else{
            
            
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setObject:PIN forKey:@"PIN"];
            
            [defaults synchronize];
            [self downloadVideo];
            [self.delegate updateVC];
           // [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    

    
}
-(void)downloadVideo{
    [self addActivity];
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];

    //   NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/video?media_id=%@&user_id=%@&token=%@&device_name=%@",media_id,userID,token,@"ios"];
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
            [alert show];
        }
        else{
            
            
            NSDictionary *medialist=[responseObject valueForKey:@"StreamLink"];
            
            NSString *VideoURL=[medialist valueForKey:@"SD"];
            self.caption_URL=VideoURL;
            [self playMovie:VideoURL];
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];

    
    
}
-(void)tableDataDownload{
    [self addActivity];
    //   NSDictionary *postParams;
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];

    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/relatedMedia?media_id=%@&user_id=%@&token=%@",media_id,userID,token];
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
            
            
            NSArray *medialist=[responseObject valueForKey:@"medialist"];
            
            
            
            
            // NSMutableArray *deal=[[NSMutableArray alloc]init];
            NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < [medialist count]; i++)
            {
                
                DealsVCDictionary = [medialist objectAtIndex:i];
                
                relatedMediaDataModel *dealsDataModel = [[relatedMediaDataModel alloc] init];
                dealsDataModel.title=[ DealsVCDictionary valueForKey:@"title"];
                dealsDataModel.largeimage_url=[DealsVCDictionary valueForKey:@"smallimage"];
                dealsDataModel.classification=[DealsVCDictionary valueForKey:@"classification"];
                dealsDataModel.media_id=[DealsVCDictionary valueForKey:@"media_id"];
                dealsDataModel.time=[DealsVCDictionary valueForKey:@"length"];
                dealsDataModel.paymentstatusl=[DealsVCDictionary valueForKey:@"paymentstatus"];

                [dealsDataArray addObject:dealsDataModel];
                
            }
            [mytableArray addObjectsFromArray:dealsDataArray];
            
            
            
            
            
            
            
            _scrollview.hidden=NO;

            [self.mytable reloadData];
            [self.mytable reloadInputViews];
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
   // [self removeActivity];

}

-(void)downLoadList{
    [self addActivity];
 //   NSDictionary *postParams;
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];

    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/mediadetail?media_id=%@&user_id=%@&token=%@",media_id,userID,token];
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
            
            
            NSArray *medialist=[responseObject valueForKey:@"MediaDetail"];
            
            
            
            
            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
            
          
                
                DetailDataModel *dealsDataModel = [[DetailDataModel alloc] init];
                dealsDataModel.title=[ medialist valueForKey:@"title"];
                dealsDataModel.hdimage=[medialist valueForKey:@"largeimage"];
                dealsDataModel.classification=[medialist valueForKey:@"classification"];
                dealsDataModel.detail=[medialist valueForKey:@"description"];
                dealsDataModel.length=[medialist valueForKey:@"length"];
            dealsDataModel.media_url=[medialist valueForKey:@"media_url"];
            dealsDataModel.price=[medialist valueForKey:@"price"];
            dealsDataModel.crew=[medialist valueForKey:@"crew"];
            dealsDataModel.cast=[medialist valueForKey:@"cast"];
            dealsDataModel.resume=[medialist valueForKey:@"resume"];




                [dealsDataArray addObject:dealsDataModel];
                
    
            [myArray addObjectsFromArray:dealsDataArray];
            
            
            
            
            [self UpdateUI];
            
            
          
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    
}

-(void)UpdateUI{
    DetailDataModel *model=[myArray objectAtIndex:0];
    self.price.text=[NSString stringWithFormat:@" $%@ | ",[model price] ];
    self.time.text=[NSString stringWithFormat:@"%@ sec | ",[model length] ];
    self.classification.text=[model classification];
    self.FilmTitle.text=[model title];
//    self.filmDes.text=[model detail];
//    [self.filmDes sizeToFit];
//    self.filmDes.numberOfLines = 0;
    
    
    
    CGSize maximumLabelSize = CGSizeMake(292, 1500);
    
    
    CGSize expectedLabelSize = [model.detail boundingRectWithSize: maximumLabelSize options: NSStringDrawingUsesLineFragmentOrigin
                                                    attributes: @{ NSFontAttributeName: self.filmDes.font } context: nil].size;
    
    //adjust the label the the new height.
    CGRect newFrame = self.filmDes.frame;
    newFrame.size.height = expectedLabelSize.height;
    self.filmDes.frame = newFrame;
    self.filmDes.text=model.detail;
    self.filmDes.lineBreakMode=NSLineBreakByWordWrapping;
    self.filmDes.numberOfLines=0;
    

    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [model hdimage]]];
   [self.imageview initWithImage:[UIImage imageWithData: imageData]];
    NSDictionary *des=[model cast];
    NSDictionary *crewDic=[model crew];

    NSLog(@"dic:%@",des);
    
    

    NSArray *arr=[des valueForKey:@"castName"];
    NSArray *crewArr=[crewDic valueForKey:@"crewName"];
    
   // NSString *crewLb=[[[model crew] objectForKey:@"crewName"] componentsJoinedByString: @","];
    
    
      //  self.directorLabel.text=[crewArr componentsJoinedByString: @","];
     self.directorLabel.text= [crewArr componentsJoinedByString: @","];

    
    self.actorLabel.text=   [arr componentsJoinedByString: @","];



    
    
}


#pragma mark TableView Delegates

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 136;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [mytableArray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"detailcell";
    detailcell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[detailcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        // More initializations if needed.
    }
    cell.backgroundColor=[UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    relatedMediaDataModel *model;
    model= [mytableArray objectAtIndex:indexPath.row];
    
   // NSString *time=[self timeFormatted:[model.time integerValue] ];
    
    
    cell.classification_name.text=[NSString stringWithFormat:@"%@ | 2014 ",[model classification]];
    cell.titlename.text=[model title];
    NSString *url=[model largeimage_url];
    
//     [cell.tableimageview setImageWithURL:[NSURL URLWithString:url]
//                  placeholderImage:[UIImage imageNamed:@"location.png"]];
     // NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
      //[cell.imageview initWithImage:[UIImage imageWithData: imageData]];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    
    dispatch_async(queue, ^{
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
          //  Set the image to image view not, wither cell.imageview or [cell add subviw:imageview later ]
            [cell.tableimageview initWithImage:[UIImage imageWithData: imageData]];
            [cell.tableimageview setNeedsLayout];
            cell.tableimageview.contentMode = UIViewContentModeScaleAspectFit;
        });
    });
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    relatedMediaDataModel *model;
    model= [mytableArray objectAtIndex:indexPath.row];
    DetailVC *detail=[[DetailVC alloc]init];
    
    
    UIStoryboard *sb;
    
    if(IS_IPAD){
        sb = [UIStoryboard storyboardWithName:@"ipad" bundle:nil];
        
    }
    else if(IS_IPHONE){
        sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    detail = [sb instantiateViewControllerWithIdentifier:@"DETAILID"];
    detail.media_id=[model media_id];
    //detail.title=[model title];
    detail.paymentStatus=[model paymentstatusl];

    [self.navigationController pushViewController:detail animated:YES];
    
    
    
    
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


- (IBAction)playVideoBtnTapped:(id)sender {
    
    if([self.paymentStatus isEqualToString:@"false"]){
        UIAlertView* dialog = [[UIAlertView alloc] init];
        [dialog setDelegate:self];
        dialog.alertViewStyle=UIAlertViewStylePlainTextInput;
        [dialog setTitle:@"Pay to watch the movie"];
        [dialog setMessage:@"Enter your PIN"];
        
        [dialog addButtonWithTitle:@"Cancel"];
        [dialog addButtonWithTitle:@"Ok"];
        
        
        UITextField *_UITextField  = [dialog textFieldAtIndex:0];
        _UITextField.placeholder = @"PIN";
        _UITextField.keyboardType = UIKeyboardTypeNumberPad;
        _UITextField.secureTextEntry=YES;
        _UITextField.delegate=self;
        [dialog show];
    }
    else{
       
        
        [self downloadVideo];
    }

}
-(void)playMovie:(NSString*)urllink{
    
    NSString *status = [[NSUserDefaults standardUserDefaults] objectForKey:@"status"];

    
    NSString *myurl=urllink;
    NSURL *url = [NSURL URLWithString:myurl];
    
    moviePlayer= [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MPMoviePlayerDidExitFullscreen:) name:MPMoviePlayerDidExitFullscreenNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackStateChanged)
                                                 name:
     MPMediaPlaybackIsPreparedToPlayDidChangeNotification
 object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
    // Set frame of movie player
    [[moviePlayer view] setFrame:CGRectMake(0, 0, 480, 320)];
    moviePlayer.view.frame = CGRectMake(184, 200, 400, 300);

   
    DetailDataModel *model=[myArray objectAtIndex:0];
    NSString *seek=[model.resume valueForKey:@"seeking_position"];
    double timeInterval = [seek doubleValue];
    NSTimeInterval intervalForTimer = timeInterval;
    
    if([status isEqualToString:@"Begining"]){
        [moviePlayer play];

    }
    
    else{
    
        if([seek isEqualToString:@""]){
        [moviePlayer play];

        }
        else{
        
            moviePlayer.initialPlaybackTime=intervalForTimer;

            }
        
    }
    
    [self.view addSubview:moviePlayer.view];
    
    [moviePlayer setFullscreen:YES];
}



- (void)MPMoviePlayerDidExitFullscreen:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerDidExitFullscreenNotification
                                                  object:nil];
    _currentPlaybackTime = [moviePlayer currentPlaybackTime];
    
    NSLog(@"%f",_currentPlaybackTime);
    [self.moviePlayer stop];
    NSString *status = [[NSUserDefaults standardUserDefaults] objectForKey:@"status"];
    if([status isEqualToString:@"resume"]){
        [self setvideoForResume];
        
    }
    
    
    [self.moviePlayer.view removeFromSuperview];
}
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}
-(void)doneButtonClick:(NSNotification*)aNotification{
    NSNumber *reason = [aNotification.userInfo objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    
    if ([reason intValue] == MPMovieFinishReasonUserExited) {
        // Your done button action here
        // [moviePlayer stop];
        NSLog(@"edfsafa");
        //  [self.moviePlayer setFullscreen:NO animated:YES];
        
        [self.moviePlayer.view removeFromSuperview];
        [self.moviePlayer.view setHidden:YES];
       

        // [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void) playbackStateChanged {
    
    moviePlayer.playbackState; // reading the playback
    NSLog(@"time:%d",times);
 
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex==1){
        [self downloadVideoURL:self.PIN];
        
        //[self downloadVideo];

    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    self.PIN=textField.text;
    
    NSLog(@"pin:%@",self.PIN);
    
    
}





-(void)setvideoForResume{
    
    
    [self addActivity];
    //   NSDictionary *postParams;
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    DetailDataModel *model=[myArray objectAtIndex:0];

    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *data=[NSString stringWithFormat:@"mediaId=%@&userid=%@&token=%@&quality=%@&media_url=%@&caption_url=%@&seeking_position=%f",media_id,userID,token,@"sd",model.media_url,_caption_URL,_currentPlaybackTime];
    data = [data stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];

    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/resumeplay?%@",data];
    
   

   // url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];


    
    NSLog(@"url: %@", url);

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:url parameters:nil];
    
    [request setTimeoutInterval:200];
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
            
            
//            NSArray *medialist=[responseObject valueForKey:@"MediaDetail"];
//            
//            
//            
//            
//            NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
//            
//            
//            
//            DetailDataModel *dealsDataModel = [[DetailDataModel alloc] init];
//            dealsDataModel.title=[ medialist valueForKey:@"title"];
//            dealsDataModel.hdimage=[medialist valueForKey:@"largeimage"];
//            dealsDataModel.classification=[medialist valueForKey:@"classification"];
//            dealsDataModel.detail=[medialist valueForKey:@"description"];
//            dealsDataModel.length=[medialist valueForKey:@"length"];
//            dealsDataModel.media_url=[medialist valueForKey:@"media_url"];
//            dealsDataModel.price=[medialist valueForKey:@"price"];
//            dealsDataModel.crew=[medialist valueForKey:@"crew"];
//            dealsDataModel.cast=[medialist valueForKey:@"cast"];
//            
//            
//            
//            [dealsDataArray addObject:dealsDataModel];
//            
//            
//            [myArray addObjectsFromArray:dealsDataArray];
//            
//            
//            
//            
//            [self UpdateUI];
            
            
            
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    
}
@end
