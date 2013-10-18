//
//  OtClaimDisturbanceViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/27/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "OtAppDelegate.h"
#import "OtClaimDisturbanceViewCtrl.h"

@interface OtClaimDisturbanceViewCtrl ()

@end

@implementation OtClaimDisturbanceViewCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeDefault;

    // set texts
//    self.approveButton.titleLabel.text = AMLocalizedString(@"claimdisturbance.approve", @"Approve");
//    self.claimDisturbanceNotice.text = AMLocalizedString(@"claimdisturbance.notice", @"Yep, I have a disturbance");
    
    // set styles
//    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
//    self.approveButton.layer.cornerRadius = 4;
    self.claimDisturbanceNotice.layer.cornerRadius = 6;
    self.claimDisturbanceNotice.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSideMenu:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

-(IBAction)claimDisturbance:(UIButton *)sender
{
    // TODO
    
    
    
    
}



@end
