//
//  OtMasterViewController.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtOutage.h"
#import "OtMasterViewCtrl.h"
#import "OtDetailViewCtrl.h"
#import "OtOutageDataCtrl.h"

@interface OtMasterViewCtrl ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation OtMasterViewCtrl

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    OtOutage *outageAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:outageAtIndex.description];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *) outageAtIndex.startDate]];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showOutageDetail"])
    {
        OtDetailViewCtrl *detailViewController = [segue destinationViewController];
        detailViewController.outage = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    // TODO
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    // TODO
}


@end
