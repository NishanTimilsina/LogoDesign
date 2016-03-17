//
//  AppDelegate.h
//  KonnectPlus
//
//  Created by One Platinum on 11/24/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftsideBarVC.h"
#import "UISidebarViewController.h"
#import "MainVC.h"
#import "LoginVC.h"
#import "PPRevealSideViewController.h"
#import "SWRevealViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
//@class SWRevealViewController;

@property (strong, nonatomic) UIWindow *window;
//@property(nonatomic,strong)UISidebarViewController *viewcontroller;
@property(nonatomic,strong) UINavigationController *leftnav;
-(void)EnterHome;
-(void)leftsideMenu;
-(void)LoginView;
@property (strong, nonatomic) PPRevealSideViewController *revealSideViewController;
@property (strong, nonatomic) SWRevealViewController *viewController;
@property(nonatomic,strong)SWRevealViewController *revealController;
@end
