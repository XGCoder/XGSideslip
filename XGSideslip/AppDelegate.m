//
//  AppDelegate.m
//  XGSideslip
//
//  Created by 赵小嘎 on 15-1-27.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import "AppDelegate.h"
#import "XGSideMenuViewController.h"
#import "ViewController.h"
#import "XGTableViewController.h"
#import "BasicNavViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //侧边栏
    XGTableViewController * side = [[XGTableViewController alloc]init];
    side.view.backgroundColor = [UIColor redColor];
    //首页
    ViewController * menu = [[ViewController alloc]init];
    menu.view.backgroundColor = [UIColor blueColor];
    BasicNavViewController * nav = [[BasicNavViewController alloc]initWithRootViewController:menu];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"测试" image:nil selectedImage:nil];
    
    ViewController * menu1 = [[ViewController alloc]init];
    menu1.view.backgroundColor = [UIColor yellowColor];
    BasicNavViewController * nav1 = [[BasicNavViewController alloc]initWithRootViewController:menu1];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"测试1" image:nil selectedImage:nil];
    
    UITabBarController * tabbar = [[UITabBarController alloc]init];
    tabbar.viewControllers = @[nav,nav1];
    
    
    XGSideMenuViewController * rootViewControl = [[XGSideMenuViewController alloc]initWithSideControl:side andMenuControl:tabbar];
    self.window.rootViewController = rootViewControl;
    [self.window makeKeyAndVisible];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
