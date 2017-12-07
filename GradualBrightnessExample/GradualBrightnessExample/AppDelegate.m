//
//  AppDelegate.m
//  GradualBrightnessExample
//
//  Created by shenyuanluo on 2017/12/7.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)configDefaultBrightness
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO]
                                              forKey:IS_NEED_CHANGE_BRIGHTNESS];
    [GradualBrightness sySaveDefaultBrightness];
}


- (void)configNavigationBar
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.backgroundColor  = [UIColor lightGrayColor];
    navigationBar.tintColor        = [UIColor darkGrayColor];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configDefaultBrightness];
    
    [self configNavigationBar];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    BOOL isNeedChangeBrightness = [[userDefault objectForKey:IS_NEED_CHANGE_BRIGHTNESS] boolValue];
    if (YES == isNeedChangeBrightness)
    {
        [GradualBrightness syResumeBrightness];
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    BOOL isNeedChangeBrightness = [[userDefault objectForKey:IS_NEED_CHANGE_BRIGHTNESS] boolValue];
    if (YES == isNeedChangeBrightness)
    {
        [GradualBrightness syConfigBrightness:CUSTOM_BRIGHTNESS_VAULE];
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
