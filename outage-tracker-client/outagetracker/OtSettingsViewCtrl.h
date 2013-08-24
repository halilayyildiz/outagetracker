//
//  OtSettingsViewCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/28/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtSettingsViewCtrl : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userId;
@property (strong, nonatomic) IBOutlet UITextField *installationId;
@property (strong, nonatomic) IBOutlet UITextField *appVersion;

-(IBAction)showSideMenu:(id)sender;

@end
