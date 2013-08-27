//
//  OtMasterViewController.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@class OtOutageDataCtrl;

@interface OtMasterViewCtrl : UITableViewController

@property (strong, nonatomic) OtOutageDataCtrl *dataController;

- (IBAction)showSideMenu:(id)sender;
- (IBAction)userRegistrationCompleted:(UIStoryboardSegue *)unwindSegue;

@end
