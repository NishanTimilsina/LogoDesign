//
//  ForgotPasswordVC.m
//  KonnectPlus
//
//  Created by One Platinum on 12/11/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "ForgotPasswordVC.h"

@interface ForgotPasswordVC ()

@end

@implementation ForgotPasswordVC
@synthesize HUD;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self FirstLoad];
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    tapBackground.cancelsTouchesInView = NO;
    _submitBtn.clipsToBounds=YES;
    _submitBtn.layer.cornerRadius=8;
    _submitBtn.layer.borderWidth=1;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.toolbar setHidden:NO];
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y-20.0);
    //[_scrollview setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    //[_scrollview setContentOffset:CGPointZero animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
    
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
    
    _emailtextfield.inputAccessoryView = self.toolbar;
    
    
    
    self.toolbar.barStyle=UIBarStyleDefault;
    self.toolbar.backgroundColor=[UIColor colorWithRed:153/255.0f green:51/255.0f blue:204/255.0f alpha:0.7];
    
    [self.toolbar setHidden:YES];
    // [_scrollView addSubview:self.toolbar];
    
    
    
}
-(void)keyboardHide{
    [_emailtextfield resignFirstResponder];
    
    
    
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

-(void)addActivity{
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    //  HUD.color=[UIColor redColor];
    HUD.labelText = @"Login...";
    self.view.userInteractionEnabled=FALSE;
    //HUD.c
    [HUD show:YES];
}
-(void)removeActivity{
    
    self.view.userInteractionEnabled=TRUE;
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(void)sendPassword{
    
    
    
  
    
    [self addActivity];
    NSDictionary *postParams;
    NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/forgotpassword?emailid=%@&toekn=%@",_emailtextfield.text,token];
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Your password is send to your email address" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alert show];
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    [manager.operationQueue addOperation:operation];

    
    
}

- (IBAction)submit:(id)sender {
    if([_emailtextfield.text isEqualToString:@""]){
        [_emailtextfield becomeFirstResponder];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Enter Email address." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    else if(![self isValidEmail:_emailtextfield.text]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Enter Valid Email address." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        [_emailtextfield becomeFirstResponder];
    }
    else{
    [self sendPassword];
    }
}

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
- (IBAction)doneBtntapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
