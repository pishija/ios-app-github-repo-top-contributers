//
//  AppFlowCoordinator.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppFlowCoordinator : NSObject

@property (nonatomic, readonly) UIWindow *window;

@property (nonatomic, readonly) UINavigationController *rootViewControler;

//Designated initalizer
- (instancetype)initWithWindow:(UIWindow *)window;

- (void)start;

@end
