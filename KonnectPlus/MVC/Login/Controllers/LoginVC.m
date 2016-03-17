//
//  LoginVC.m
//  KonnectPlus
//
//  Created by One Platinum on 12/9/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC
@synthesize HUD;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self FirstLoad];
    _scrollview.contentSize=CGSizeMake(_scrollview.frame.size.width, 750);
    _emailtextfield.delegate=self;
    _passwordtextfield.delegate=self;
    _deviceModelTextField.delegate=self;
    _deviceNameTextField.delegate=self;
    _deviceSerialTextField.delegate=self;
    _appVersionTextField.delegate=self;
    _passwordtextfield.secureTextEntry=YES;
    _emailtextfield.text=@"testiosppv@gmail.com";
    _passwordtextfield.text=@"testpayperview";
    _loginBtn.clipsToBounds=YES;
    _loginBtn.layer.cornerRadius=8;
    _loginBtn.layer.borderWidth=1;

    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    tapBackground.cancelsTouchesInView = NO;
    
    self.device_name= [[UIDevice currentDevice] name];
    _deviceNameTextField.enabled=NO;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    NSLog(@"%f",width);
    
    
    
    //for device model
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    self.device_model=[self platformType:platform];
    
    free(machine);
    //for app version
    NSString *ver=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    self.app_version=ver;
    
    //for device serial_number
    self.device_serial=[[[UIDevice currentDevice] identifierForVendor] UUIDString];
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

- (IBAction)forgotPassBtn:(id)sender {
    ForgotPasswordVC *ship=[self.storyboard instantiateViewControllerWithIdentifier:@"FORGOTID"];
    [self presentViewController:ship animated:YES completion:nil];

}

- (IBAction)submitBtntapped:(id)sender {
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
    else if([_passwordtextfield.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Enter Password." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];

        [_passwordtextfield becomeFirstResponder];
    }
    else{
    [self Login];
    }
    
   // AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
   // [appDelegate EnterHome];

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

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.toolbar setHidden:NO];
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y-20.0);
    [_scrollview setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_scrollview setContentOffset:CGPointZero animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
    
}
-(void)Login{
    [self addActivity];
    NSDictionary *postParams;
  NSString *token=@"ANGxryY2MgDEruiOfIFMGwKdaQlDAQxnXQrRku";
    NSString *url=[NSString stringWithFormat:@"http://api_konnectplus.tv:H23RNVSTYPP46WFY@konnectplus.tv/api/device/signin?device_name=%@&device_model=%@&device_serial_no=%@&app_version=%@&emailid=%@&password=%@&token=%@",self.device_name,self.device_model,self.device_serial,self.app_version,_emailtextfield.text,_passwordtextfield.text,token];
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
            
            NSDictionary *userDic=[responseObject valueForKey:@"user"];
            NSString *userID=[userDic valueForKey:@"user_id"];
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setObject:userID forKey:@"user_id"];
            
            [defaults synchronize];
            
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            
            [appDelegate EnterHome];
        
        }

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        [self removeActivity];

        
    }];
    [manager.operationQueue addOperation:operation];
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
    _passwordtextfield.inputAccessoryView=self.toolbar;
   
    
    
    self.toolbar.barStyle=UIBarStyleDefault;
    self.toolbar.backgroundColor=[UIColor colorWithRed:153/255.0f green:51/255.0f blue:204/255.0f alpha:0.7];
    
    [self.toolbar setHidden:YES];
    // [_scrollView addSubview:self.toolbar];
    
    
    
}
- (NSString *) platformType:(NSString *)platform
{
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2G (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2G (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}
-(void)keyboardHide{
    [_emailtextfield resignFirstResponder];
    [_passwordtextfield resignFirstResponder];
  
    
    
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

- (IBAction)DoneButton:(id)sender {
    NSLog(@"i am done btn");
    NSLog(@"%@",self.navigationController);
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
@end
