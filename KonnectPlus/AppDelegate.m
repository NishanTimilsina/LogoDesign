//
//  AppDelegate.m
//  KonnectPlus
//
//  Created by One Platinum on 11/24/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "AppDelegate.h"
#import "sidebarVC.h"
#import "ServerURl.h"
#import "MenuVC.h"
#import "SWRevealViewController.h"

@interface AppDelegate ()<pushViewToNavigationDelegate>
@property(nonatomic,strong)LoginVC *login;
@end
@implementation AppDelegate
@synthesize leftnav,login,revealController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIStoryboard *sb;
   login=[[LoginVC alloc]init];
    MainVC *main=[[MainVC alloc]init];
    MenuVC *left=[[MenuVC alloc]init];
    
    
    
    if(IS_IPAD){
        sb = [UIStoryboard storyboardWithName:@"ipad" bundle:nil];
        
    }
    else if(IS_IPHONE){
        sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    left = [sb instantiateViewControllerWithIdentifier:@"MENUVC"];

    main = [sb instantiateViewControllerWithIdentifier:@"MAINID"];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:main];
    
  
    UINavigationController *navMenu=[[UINavigationController alloc]initWithRootViewController:left];
    [navMenu.navigationBar setBackgroundImage:[UIImage imageNamed:@"ico_nav.png"] forBarMetrics:UIBarMetricsDefault];

    
   revealController = [[SWRevealViewController alloc] initWithRearViewController:navMenu frontViewController:nav];
    revealController.delegate = self;
    
    self.viewController = revealController;
    
    
    login = [sb instantiateViewControllerWithIdentifier:@"LOGINVC"];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSString *status = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    if(status.length==0)
    {
    self.window.rootViewController = self.login;
        
    }
    else{
        self.window.rootViewController = self.viewController;

    }
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)EnterHome{
    self.viewController = revealController;

    self.window.rootViewController=self.viewController;
}
-(void)LoginView{
    NSString *status = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    
    if(status.length==0){

    self.window.rootViewController=login;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
