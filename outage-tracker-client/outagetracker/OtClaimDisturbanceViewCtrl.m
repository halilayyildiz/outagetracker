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
    
    // set styles
    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    self.approveButton.layer.cornerRadius = 4;
    self.messageLabel.layer.cornerRadius = 4;
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeDefault;
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
