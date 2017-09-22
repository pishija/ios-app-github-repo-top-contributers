//
//  ContributorsFeedViewController.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "ContributorsFeedViewController.h"
#import "UserTableViewCell.h"
#import "GHUser.h"

#define kUserTableCellIdentifier @"UserTableCellIdentifier"

@interface ContributorsFeedViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ContributorsFeedViewController

#pragma mark - Initializators

//Designated initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil presenter:(id<ContributorsFeedPresenterInterface>)presenter{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _presenter = presenter;
        self.dataSource = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    ContributorsFeedPresenter *presenter = [[ContributorsFeedPresenter alloc] init];
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil presenter:presenter];
}

//Convenience initializer
- (instancetype)initWithPresenter:(id<ContributorsFeedPresenterInterface>)presenter{
    return [self initWithNibName:nil bundle:nil presenter:presenter];
}

#pragma mark - ViewLifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"UserTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:kUserTableCellIdentifier];
    
    [self.presenter attachView:self];
    [self.presenter loadData];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.presenter detachView];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserTableViewCell *cell = (UserTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kUserTableCellIdentifier];
    GHUser *user = self.dataSource[indexPath.row];
    
    [cell setTitle:user.login];
    [cell setInitials:@"AM"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

#pragma mark - Public interface

- (void)setContributors:(NSArray *)contriboturs{
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:contriboturs];
    [self.tableView reloadData];
}

- (void)appendContributors:(NSArray *)contributors{
    [self.dataSource addObjectsFromArray:contributors];
    [self.tableView reloadData];
}

- (void)showTakeOverLoading{
    
}

- (void)hideTakeOverLoading{
    
}

- (void)showPaginationLoading{
    
}

- (void)hidePaginatonLoadin{
    
}

@end
