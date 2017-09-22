//
//  ContributorsFeedPresenter.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ContributorsFeedViewController;

@protocol ContributorsFeedPresenterInterface <NSObject>

- (void)loadData;
- (void)loadDataForOffset:(NSInteger)offset;
- (void)attachView:(ContributorsFeedViewController *)view;
- (void)detachView;

@property (nonatomic, strong) ContributorsFeedViewController *view;

@end

@interface ContributorsFeedPresenter: NSObject <ContributorsFeedPresenterInterface>

@end
