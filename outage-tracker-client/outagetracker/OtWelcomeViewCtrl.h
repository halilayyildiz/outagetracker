//
//  OtWelcomeViewCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtWelcomeViewCtrl : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *installationId;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
- (IBAction)next:(UIButton *)sender;

@end