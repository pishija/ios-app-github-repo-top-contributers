//
//  TopContributorsFeedPresenter.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "TopContributorsFeedPresenter.h"
#import "ContributorsFeedViewController.h"

@implementation TopContributorsFeedPresenter

@synthesize view = _view;

- (void)loadData{
    
}

- (void)loadDataForOffset:(NSInteger)offset{
    
}

- (void)attachView:(ContributorsFeedViewController *)view{
    self.view = view;
    self.view.title = NSLocalizedString(@"Top Contributors", nil);
}

- (void)detachView{
    
}

@end
