//
//  OtMasterViewController.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "OtAppDelegate.h"
#import "OtOutage.h"
#import "OtMasterViewCtrl.h"
#import "OtDetailViewCtrl.h"
#import "OtOutageDataCtrl.h"
#import "OtSettingsViewCtrl.h"
#import "OtMasterViewOutageCell.h"


@interface OtMasterViewCtrl ()

-(BOOL)isUserRegistered;

@end

@implementation OtMasterViewCtrl

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[OtOutageDataCtrl alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(refreshViewData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    // if user is not registered, then navigate to main screen
    if (!self.isUserRegistered)
    {
        [self performSegueWithIdentifier: @"showWelcomeView" sender: self];
    }
    
    [self refreshViewData];
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSideMenu:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController outageCountInList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OutageCell";
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    OtMasterViewOutageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    OtOutage *outageAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell description] setText:outageAtIndex.description];
    [[cell startDate] setText:[OtUtils formatDate:outageAtIndex.startDate]];
    [[cell duration] setText:[OtUtils durationBetweenDate:outageAtIndex.startDate andDate:outageAtIndex.endDate]];
    [[cell numOfAffectedCustomers] setText:[NSString stringWithFormat:@"%d", outageAtIndex.numOfAffectedCustomers]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)refreshViewData
{
    self.view.userInteractionEnabled = NO;
    [self.refreshControl beginRefreshing];
    [self.dataController reloadOutagesAndNotify:^{
        [self updateTable];
        self.view.userInteractionEnabled = YES;
        [self.refreshControl endRefreshing];
    }];
}

- (void)updateTable
{
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showOutageDetail"])
    {
        OtDetailViewCtrl *detailViewController = [segue destinationViewController];
        detailViewController.outage = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

-(BOOL)isUserRegistered
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults valueForKey:OT_USER_ID];
    
    return !(userId == nil || [userId isEqualToString:@""]);
}

- (IBAction)userRegistrationCompleted:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"User Registration Completed.");
}


@end
