//
//  OtMasterViewController.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OtOutageDataCtrl;

@interface OtMasterViewCtrl : UITableViewController

@property (strong, nonatomic) OtOutageDataCtrl *dataController;

//- (IBAction)done:(UIStoryboardSegue *)segue;
//- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
