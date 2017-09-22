//
//  TopContributorsFeedPresenter.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "TopContributorsFeedPresenter.h"
#import "ContributorsFeedViewController.h"
#import "GHUser.h"

@implementation TopContributorsFeedPresenter

@synthesize view = _view;

- (void)loadData{
    
    [self.view showTakeOverLoading];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        sleep(1);
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for(int i = 0; i < 10; ++i){
            GHUser *user = [[GHUser alloc] init];
            [user fillWithDummy];
            
            [array addObject:user];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            [self.view hideTakeOverLoading];
            [self.view setContributors:array];
        });
    });
}

- (void)loadDataForOffset:(NSInteger)offset{
    [self.view showTakeOverLoading];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        sleep(1);
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for(int i = 0; i < 10; ++i){
            GHUser *user = [[GHUser alloc] init];
            [user fillWithDummy];
            
            [array addObject:user];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            [self.view hideTakeOverLoading];
            [self.view appendContributors:array];
        });
    });
}

- (void)attachView:(ContributorsFeedViewController *)view{
    self.view = view;
    self.view.title = NSLocalizedString(@"Top Contributors", nil);
}

- (void)detachView{
    self.view = nil;
}

@end
