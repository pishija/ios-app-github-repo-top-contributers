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
#import "GHApiManager.h"

@interface TopContributorsFeedPresenter()

@property (nonatomic, strong) GHApiManager *apiManager; //this is here for the example
@property (nonatomic) NSInteger offset;

@end

@implementation TopContributorsFeedPresenter

@synthesize view = _view;

#pragma mark - Initialzers

- (instancetype)initWithRepo:(NSString *)repo owner:(NSString *)owner{
    self = [super init];
    if (self){
        _owner = owner;
        _repo = repo;
        _apiManager = [[GHApiManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com/"]];
    }
    return self;
}

- (instancetype)init{
    return [self initWithRepo:@"ruby" owner:@"ruby"];
}

- (void)loadData{
    
    [self.view showTakeOverLoading];
    
    __block TopContributorsFeedPresenter *weakSelf = self;
    [self.apiManager fetchContributorsForRepo:self.repo
                                        owner:self.owner
                                         page:1
                              completionBlock:^(NSArray *users, NSError *error) {
                                  [weakSelf.view hideTakeOverLoading];
                                  if (error == nil){
                                      [weakSelf.view setContributors:users];
                                  } else{
                                      [weakSelf.view showError:error];
                                  }
    }];

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
