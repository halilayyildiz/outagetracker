//
//  OtDetailViewController.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtDetailViewCtrl.h"
#import "OtOutage.h"

@interface OtDetailViewCtrl()

- (void)configureView;

@end

@implementation OtDetailViewCtrl

#pragma mark - Managing the detail item

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
        self.descLabel.text = theOutage.desc;
        self.locationLabel.text = theOutage.location;
        self.startDateLabel.text = [formatter stringFromDate:(NSDate *)theOutage.startDate];
        self.endDateLabel.text = [formatter stringFromDate:(NSDate *)theOutage.endDate];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
