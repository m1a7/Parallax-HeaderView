//
//  AppDelegate.m
//  Parallax-HeaderView
//
//  Created by Uber on 20/01/2018.
//  Copyright © 2018 Uber. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    
    
    // Init Controller
    TableViewController* vc = [[TableViewController alloc] init];
   
    
    // Init uinavigationcontroller
    UINavigationController* navContr = [[UINavigationController alloc] initWithRootViewController:vc];
    
    navContr.navigationBar.topItem.title = @"HiNative";

     navContr.navigationBar.barStyle = UIBarStyleBlack;
    NSDictionary* titleTextAttributesDict = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                              NSFontAttributeName            : [UIFont fontWithName:@"AvenirNext-Medium" size:23]};
    
    [navContr.navigationBar setTitleTextAttributes: titleTextAttributesDict];
    
    // Set this vc like root view controller
    [[UIApplication sharedApplication].keyWindow setRootViewController:navContr];

    
    
    return YES;
}



@end
