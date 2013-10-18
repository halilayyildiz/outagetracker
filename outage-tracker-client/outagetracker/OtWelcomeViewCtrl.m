//
//  OtWelcomeViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MBProgressHUD.h"
#import "OtAppDelegate.h"
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
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeNone;
    
    // set styles
//    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    self.billImage.layer.cornerRadius = 4.0f;
//    self.installationIdTextField.layer.cornerRadius = 4.0f;
//    self.registerButton.layer.cornerRadius = 4.0f;
    
//    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
//    self.installationIdTextField.leftView = paddingView;
//    self.installationIdTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //    [self.registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}


- (IBAction)registerUser:(UIButton *)sender
{
    id<OtOutageClientProtocol> outageClient = [[OtOutageClient alloc] init];
    NSString *installationId = self.installationIdTextField.text;
    
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



@end
