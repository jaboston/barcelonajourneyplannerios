//
//  BRPAppDelegate.m
//  Barcelona Router Planner
//
//  Created by Joseph Boston on 04/10/2013.
//  Copyright (c) 2013 Jaboston. All rights reserved.
//

#import "BRPAppDelegate.h"

@implementation BRPAppDelegate

// I would usually use a storyboard to overcome the screensize issues.
// How do you guys deal with it?
// Heres a blog post I made: http://www.jaboston.com/2013/06/working-with-the-iphone-5-screen/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    result = CGSizeMake(result.width * scale, result.height * scale);
    
    if(result.height == 1136){
        
        NSLog(@"iPhone5");
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone5" bundle:nil];
        
        UIViewController *initViewController = [storyBoard instantiateInitialViewController];
        
        [self.window setRootViewController:initViewController];
        
    }
    
    else {
        
        NSLog(@"iPhone with 3.5 inch");
        
    }
    // Override point for customization after application launch.
    return YES;
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
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"EnteredForegroundNotification"
     object:self];
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
