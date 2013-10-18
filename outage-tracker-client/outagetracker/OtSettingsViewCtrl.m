//
//  OtSettingsViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/28/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "OtAppDelegate.h"
#import "OtSettingsViewCtrl.h"


@interface OtSettingsViewCtrl ()

@end

@implementation OtSettingsViewCtrl

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
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.cancelsTouchesInView = false;
    [self.tableView addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeDefault;
    
    // set styles
//    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
//    self.tableView.backgroundView = nil;
    
    // load user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *userId = [defaults valueForKey:OT_USER_ID];
    self.userId.text = userId;
    NSString *instId = [defaults valueForKey:OT_INST_ID];
    self.installationId.text = instId;
    NSString *lang = [defaults valueForKey:OT_LANG];
    self.language.text = lang;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)showSideMenu:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"tap began");
    [self.view endEditing:YES];
}

//- (IBAction)saveSettings:(id)sender
//{
//    if (self.installationId)
//    {
//        // save installation id to user settings
//        
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        NSString *installationIdValue = self.installationId.text;
//        [defaults setObject:installationIdValue forKey:OT_INST_ID];
//        [defaults synchronize];
//        NSLog(@"User settings are saved");
//        
//        [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
//    }
//}

- (IBAction)languageChanged:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"Language Changed Complete.");
}




@end
