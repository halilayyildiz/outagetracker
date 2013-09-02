//
//  OtSettingsViewCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/28/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface OtSettingsViewCtrl : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *language;
@property (strong, nonatomic) IBOutlet UILabel *userId;
@property (strong, nonatomic) IBOutlet UILabel *installationId;

-(IBAction)showSideMenu:(id)sender;
-(IBAction)languageChanged:(UIStoryboardSegue *)unwindSegue;

@end
