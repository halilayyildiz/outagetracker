//
//  OtSideMenuViewController.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/24/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtSideMenuViewController.h"
#import "MFSideMenu.h"
#import "OtSideMenuViewCell.h"

@interface OtSideMenuViewController : UITableViewController

@property (weak, nonatomic) IBOutlet OtSideMenuViewCell *navigateToOutagesCell;
@property (weak, nonatomic) IBOutlet OtSideMenuViewCell *navigateToClaimOutageCell;
@property (weak, nonatomic) IBOutlet OtSideMenuViewCell *navigateToSettingsCell;
@property (weak, nonatomic) IBOutlet OtSideMenuViewCell *navigateToAboutCell;

@end
