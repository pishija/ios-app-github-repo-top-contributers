//
//  AppDelegate.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "AppDelegate.h"
#import "ContributorsFeedViewController.h"
#import "AppFlowCoordinator.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppFlowCoordinator *appFlowCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    self.appFlowCoordinator = [[AppFlowCoordinator alloc] initWithWindow:self.window];
    [self.appFlowCoordinator start];
    
    return YES;
}

@end
