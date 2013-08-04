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
#import "OtSettingsViewCtrl.h"
#import "OtUtils.h"
#import "OtMasterViewOutageCell.h"


@implementation OtMasterViewCtrl

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[OtOutageDataCtrl alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    self.tableView.separatorColor = UIColorFromRGB(BGCOLOR);
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
    
    OtMasterViewOutageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    OtOutage *outageAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell description] setText:outageAtIndex.description];
    [[cell startDate] setText:[OtUtils formatDate:outageAtIndex.startDate]];
    [[cell duration] setText:[OtUtils durationBetweenDate:outageAtIndex.startDate andDate:outageAtIndex.endDate]];
    [[cell numOfAffectedCustomers] setText:[NSString stringWithFormat:@"%d", outageAtIndex.numOfAffectedCustomers]];
    
//    cell.contentView.backgroundColor = UIColorFromRGB(0xFFFFFF);
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
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
    if ([[segue identifier] isEqualToString:@"saveSettings"]) {
        
        OtSettingsViewCtrl *settingsCtrl = [segue sourceViewController];
        if (settingsCtrl.installationId) {
            // save installation id to user settings
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *installationIdValue = settingsCtrl.installationId.text;
            [defaults setObject:installationIdValue forKey:@"installationId"];
            [defaults synchronize];
            NSLog(@"User settings are saved");
            // reload data for possibly new installation id
            
            // TODO
            
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"cancelSettings"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


@end