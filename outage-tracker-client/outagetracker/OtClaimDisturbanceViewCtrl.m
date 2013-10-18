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

-(void)setHouseImage:(bool)hasDisturbance;

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
    
    self.claimDisturbanceNotice.layer.cornerRadius = 6.0f;
    self.claimDisturbanceNotice.textAlignment = NSTextAlignmentCenter;
    self.houseImageButton.layer.cornerRadius = 6.0f;
    self.houseImageButton.clipsToBounds = YES;
    
    // set house image
    bool hasDisturbance = [[NSUserDefaults standardUserDefaults] boolForKey:OT_HAS_DISTURBANCE];
    [self setHouseImage:hasDisturbance];
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

-(IBAction)changeHouseImage:(UIButton *)sender
{
    bool hasDisturbance = [[NSUserDefaults standardUserDefaults] boolForKey:OT_HAS_DISTURBANCE];
    [[NSUserDefaults standardUserDefaults] setBool:!hasDisturbance forKey:OT_HAS_DISTURBANCE];
    [self setHouseImage:!hasDisturbance];
}

-(void)setHouseImage:(bool)hasDisturbance
{
    if(hasDisturbance)
    {
        UIImage *buttonImage = [UIImage imageNamed:@"house-light-no.jpg"];
        [self.houseImageButton setImage:buttonImage forState:UIControlStateNormal];
    }
    else
    {
        UIImage *buttonImage = [UIImage imageNamed:@"house-light-yes.jpg"];
        [self.houseImageButton setImage:buttonImage forState:UIControlStateNormal];
    }
}



@end
