//
//  OtWelcomeViewCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface OtWelcomeViewCtrl : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *installationIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIImageView *billImage;

-(IBAction)registerUser:(UIButton *)sender;

@end
