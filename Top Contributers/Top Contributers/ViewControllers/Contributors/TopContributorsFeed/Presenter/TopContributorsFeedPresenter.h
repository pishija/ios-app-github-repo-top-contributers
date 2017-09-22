//
//  TopContributorsFeedPresenter.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContributorsFeedPresenter.h"

@interface TopContributorsFeedPresenter : NSObject <ContributorsFeedPresenterInterface>

@property (nonatomic, readonly) NSString *repo;
@property (nonatomic, readonly) NSString *owner;

- (instancetype)initWithRepo:(NSString *)repo owner:(NSString *)owner;

@end
