//
//  OtWelcomeViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MFSideMenuContainerViewController.h"
#import "OtUtils.h"
#import "OtWelcomeViewCtrl.h"
#import "OtOutageClient.h"
#import "OtOutageClientProtocol.h"

@interface OtWelcomeViewCtrl ()

@property () id<OtOutageClientProtocol> outageFetcher;

@end

@implementation OtWelcomeViewCtrl

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.tableView addGestureRecognizer:tap];
    
    // set styles
    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    
//    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.registerButton.backgroundColor = UIColorFromRGB(FGCOLOR);
//    self.registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.registerButton.layer.borderWidth = 0.5f;
//    self.registerButton.layer.cornerRadius = 10.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}


- (IBAction)registerUser:(UIButton *)sender
{
    id<OtOutageClientProtocol> outageClient = [[OtOutageClient alloc] init];
    NSString *installationId = self.installationId.text;
    
    [MBProgressHUD showHUDAddedTo:self.tableView  animated:YES];
    
    [outageClient registerWithInstallationId:installationId notify:^(NSString *userId){
        
        [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        
        if (userId != nil) {
            // first save user id
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:userId forKey:OT_USER_ID];
            [defaults setObject:installationId forKey:OT_INST_ID];
            [defaults synchronize];
            NSLog(@"User id saved.");
            
            // then back to main window
            [self performSegueWithIdentifier: @"backToMainViewAfterRegistration" sender: self];
        } else {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Unable to complete registration." message:[NSString stringWithFormat:@"Unexpected Error"]
                                                        delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [av show];
            NSLog(@"User registration failed !");
        }
    }]; 
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"tap began");
    [self.view endEditing:YES];
}

@end
