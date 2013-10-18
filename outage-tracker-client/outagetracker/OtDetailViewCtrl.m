//
//  OtDetailViewController.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtAppDelegate.h"
#import "OtDetailViewCtrl.h"
#import "OtOutage.h"

@interface OtDetailViewCtrl()

- (void)configureView;

@end

@implementation OtDetailViewCtrl

- (void)setOutage:(id)newOutage
{
    if (_outage != newOutage) {
        _outage = newOutage;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    OtOutage *theOutage = self.outage;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if (theOutage) {
        self.descLabel.text = theOutage.description;
        self.startDateLabel.text = [OtUtils formatDate:theOutage.startDate];
        self.endDateLabel.text = [OtUtils formatDate:theOutage.endDate];
        self.durationLabel.text = [OtUtils durationBetweenDate:theOutage.startDate andDate:theOutage.endDate];
        self.numOfAffCustomers.text = [NSString stringWithFormat:@"%d", theOutage.numOfAffectedCustomers];
        self.locationLabel.text = theOutage.location;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
