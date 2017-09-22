//
//  AppFlowCoordinator.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "AppFlowCoordinator.h"
#import "ContributorsFeedViewController.h"
#import "TopContributorsFeedPresenter.h"

@interface AppFlowCoordinator ()

@property (nonatomic, strong) UINavigationController *rootViewControler;

@end

@implementation AppFlowCoordinator

#pragma mark - Initilazators

- (instancetype)initWithWindow:(UIWindow *)window{
    self = [super init];
    if(self){
        _window = window;
    }
    return self;
}

#pragma mark - Public
- (void)start{
    self.window.rootViewController = self.rootViewControler;
}

#pragma mark - Overrides

- (UINavigationController *)rootViewControler{
    if (_rootViewControler == nil){
        
        TopContributorsFeedPresenter *presenter = [[TopContributorsFeedPresenter alloc] init];
        ContributorsFeedViewController *viewController = [[ContributorsFeedViewController alloc] initWithPresenter:presenter];
        _rootViewControler = [[UINavigationController alloc] initWithRootViewController:viewController];
    }
    return  _rootViewControler;
}

@end
