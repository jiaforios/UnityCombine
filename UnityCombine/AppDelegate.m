//
//  AppDelegate.m
//  UnityCombine
//
//  Created by admin on 2018/9/10.
//  Copyright © 2018年 com. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)unityWindow {
    return UnityGetMainWindow();
}

- (void)showUnityWindow {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 155, 85);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(hideUnityWindow) forControlEvents:UIControlEventTouchUpInside];
    [self.unityWindow addSubview:button];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    [self.unityWindow makeKeyAndVisible];
}

- (void)hideUnityWindow {
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    self.unityController = [[UnityAppController alloc] init];
    [self.unityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [self.unityController applicationWillResignActive:application];

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.unityController applicationDidEnterBackground:application];

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [self.unityController applicationWillEnterForeground:application];

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self.unityController applicationDidBecomeActive:application];

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.unityController applicationWillTerminate:application];

}


@end