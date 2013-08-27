//
//  OtSideMenuViewController.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/24/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtSideMenuViewController.h"
#import "OtMasterViewCtrl.h"
#import "OtSettingsViewCtrl.h"

@interface OtSideMenuViewController ()

@end

@implementation OtSideMenuViewController

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

    self.view.backgroundColor = UIColorFromRGB(SIDE_VIEW_BG_COLOR);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *clickedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIViewController *targetViewController = nil;
    
    if (clickedCell == self.navigateToOutagesCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OtMasterViewCtrl"];
//        targetViewController.title = @"Outages";  
    }
    else if (clickedCell == self.navigateToClaimOutageCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OtClaimDisturbanceViewCtrl"];
//        targetViewController.title = @"Outages";        
    }
    else if (clickedCell == self.navigateToSettingsCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OtSettingsViewCtrl"];
//        targetViewController.title = @"Settings";        
    }
    else if (clickedCell == self.navigateToAboutCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OtAboutViewCtrl"];
//        targetViewController.title = @"Outages";        
    }
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:targetViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}


@end
