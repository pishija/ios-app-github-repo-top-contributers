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
#import <MBProgressHUD/MBProgressHUD.h>

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
    
    NSURL *avatarURL = [NSURL URLWithString:[user avatar_url]];
    
    [cell setTitle:user.login];
    
    [cell setInitials:[user.login substringWithRange:NSMakeRange(0, 2)]];
    
    [cell setImageFromURL:avatarURL];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (endScrolling >= scrollView.contentSize.height)
    {
        [self.presenter loadDataForOffset:[self.dataSource count]];
    }
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
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideTakeOverLoading{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}

- (void)showPaginationLoading{
    //This for show that code works. I add table footer view for pagination loading
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hidePaginatonLoadin{
    //This for show that code works. I add table footer view for pagination loading
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}

- (void)showError:(NSError *)error{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error"
                                                                         message:[NSString stringWithFormat:@"Error heppened: %@",error.description]
                                                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    
    [controller addAction:okAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

@end
