//
//  ContributorsFeedViewController.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContributorsFeedPresenter.h"

@interface ContributorsFeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readonly) id <ContributorsFeedPresenterInterface> presenter;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil presenter:(id<ContributorsFeedPresenterInterface>)presenter;
- (instancetype)initWithPresenter:(id<ContributorsFeedPresenterInterface>)presenter;

- (void)setContributors:(NSArray *)contriboturs;
- (void)appendContributors:(NSArray *)contributors;

- (void)showTakeOverLoading;
- (void)hideTakeOverLoading;
- (void)showPaginationLoading;
- (void)hidePaginatonLoadin;


@end
