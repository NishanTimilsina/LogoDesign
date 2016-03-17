//
//  Setting.m
//  KonnectPlus
//
//  Created by One Platinum on 12/20/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "Setting.h"

@interface Setting ()
@property(nonatomic,strong)UIPickerView *pickerView;
@end

@implementation Setting
- (void)viewDidLoad {
    [super viewDidLoad];
    self.list=@[@"Begining",@"resume"];
    //self.navigationController.navigationBar.topItem.title = @"Setting";
    _textfield.text=[self.list objectAtIndex:0];

    
    NSString *status = [[NSUserDefaults standardUserDefaults] objectForKey:@"status"];
    if([status isEqualToString:@"Begining"]){
        _textfield.text=[self.list objectAtIndex:0];

    }
    else if([status isEqualToString:@"resume"]){
    _textfield.text=[self.list objectAtIndex:1];
    }
    self.pickerView=[[UIPickerView alloc]init];
    self.pickerView.frame=CGRectMake(0, 86, 320, 162);
   // [self.view addSubview: self.pickerView];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    _textfield.delegate=self;
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    [self.pickerView setHidden:YES];
    
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    tapBackground.cancelsTouchesInView = NO;
    
    
    // Do any additional setup after loading the view.
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _list.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _list[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    
    _textfield.text=_list[row];
    //_code=[NSString stringWithFormat:@"%d",row+1];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:_list[row] forKey:@"status"];
    
    [defaults synchronize];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    
    if ([textField isEqual:_textfield]) {
        
        self.pickerView.hidden=NO;
        self.pickerView.showsSelectionIndicator = YES;
        textField.inputView=self.pickerView;
        //self.UIPickerView= (UIPickerView *)_AgeRangeTextField.inputView;
        //[self.UIPickerView removeFromSuperview];
    }
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
