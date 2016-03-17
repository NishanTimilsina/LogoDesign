//
//  FeedbackVC.m
//  KonnectPlus
//
//  Created by One Platinum on 12/20/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//
#import "ServerURl.h"
#import "FeedbackVC.h"

@interface FeedbackVC ()

@end

@implementation FeedbackVC
@synthesize HUD;
- (void)viewDidLoad {
    [super viewDidLoad];
 //   self.navigationController.navigationBar.topItem.title = @"FeedBack";
    if(IS_IPHONE){
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width, 800);
    }
    else if(IS_IPAD){
        _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width, 1500);

    }

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self FirstLoad];
    
    
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    tapBackground.cancelsTouchesInView = NO;
    _nameTextField.delegate=self;
    _emailTextField.delegate=self;
    _phoneTextField.delegate=self;
    _subjectTextField.delegate=self;
    // Do any additional setup after loading the view.
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}
-(void)FirstLoad{
    self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    self.toolbar.backgroundColor=[UIColor orangeColor];
    
    
    //for keyboard Done button
    [_toolbar sizeToFit];
    _toolbar.items = [NSArray arrayWithObjects:
                      [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                      [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(keyboardHide)],
                      nil];
    
    _nameTextField.inputAccessoryView = self.toolbar;
    _emailTextField.inputAccessoryView=self.toolbar;;
    _phoneTextField.inputAccessoryView=self.toolbar;;
    _subjectTextField.inputAccessoryView=self.toolbar;;
    self.toolbar.barStyle=UIBarStyleDefault;
    self.toolbar.backgroundColor=[UIColor colorWithRed:153/255.0f green:51/255.0f blue:204/255.0f alpha:0.7];
    
    [self.toolbar setHidden:YES];
    
   
    
    
    
}
-(void)keyboardHide{
    [_nameTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
    
    [_phoneTextField resignFirstResponder];
    [_subjectTextField resignFirstResponder];

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

- (IBAction)submitBtn:(id)sender {
    if([_nameTextField.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Name can not be Empty" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        [_nameTextField becomeFirstResponder];
        
    }
    else if([_emailTextField.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"email can not be Empty" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        [_emailTextField becomeFirstResponder];
        
    }
    else if(![self isValidEmail:_emailTextField.text]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Enter valid email address" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        [_emailTextField becomeFirstResponder];
    }
   else if([_subjectTextField.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Subject can not be Empty" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        [_subjectTextField becomeFirstResponder];
        
    }
   else  if([_messageTextView.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"query can not be Empty" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        [_messageTextView becomeFirstResponder];
        
    }
    else{

    [self addActivity];
   // NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    
        NSDictionary *postParams=@{
                                   @"name"                 :_nameTextField.text,
                                   @"email"                 :_emailTextField.text,
                                   @"phone"                 :_phoneTextField.text,
                                   @"subject"               :_subjectTextField.text,
                                   @"query"                 :_messageTextView.text
                                   
                                   };

    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/sendEnquiry"];
    NSLog(@"url:%@",url);
    
    
    
  //  url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY" persistence:NSURLCredentialPersistenceNone];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST" URLString:url parameters:postParams];
        [request setValue: token  forHTTPHeaderField:@"token"];

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
            
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success!" message:[responseObject valueForKey:@"info"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
            _nameTextField.text=@"";
            _emailTextField.text=@"";
            _phoneTextField.text=@"";
            _subjectTextField.text=@"";
            _messageTextView.text=@"";
            [self removeActivity];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [manager.operationQueue addOperation:operation];
    
    
    }
    
}
#pragma Email Validation
-(BOOL) isValidEmail:(NSString *)checkString
{
    checkString = [checkString lowercaseString];
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:checkString];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width,1000);

    [self.toolbar setHidden:NO];
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y-20.0);
    [_scrollview setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width,900);

    [_scrollview setContentOffset:CGPointZero animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width,1600);
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width,1200);
    
}
-(void)addActivity{
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    //  HUD.color=[UIColor redColor];
    HUD.labelText = @"Loading...";
    self.view.userInteractionEnabled=FALSE;
    //HUD.c
    [HUD show:YES];
}
-(void)removeActivity{
    
    self.view.userInteractionEnabled=TRUE;
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


@end
