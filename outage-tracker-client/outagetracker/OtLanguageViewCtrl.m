//
//  OtLanguageViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/28/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtAppDelegate.h"
#import "OtLanguageViewCtrl.h"

@interface OtLanguageViewCtrl ()

@end

@implementation OtLanguageViewCtrl

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
}

- (void)viewWillAppear:(BOOL)animated
{
    OtAppDelegate *appDelegate = (OtAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeNone;
    
    // set styles
//    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
//    self.tableView.backgroundView = nil;
    
    // load user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.selectedLanguage = [defaults valueForKey:OT_LANG];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *lang = ((UILabel *)[cell viewWithTag:100]).text;
    BOOL isSelectedLang = [lang isEqualToString:self.selectedLanguage];
    cell.accessoryType = isSelectedLang ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectedLanguage = ((UILabel *)[selectedCell viewWithTag:100]).text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.selectedLanguage forKey:OT_LANG];
    [defaults synchronize];
    
    // set language
    LocalizationSetLanguage([OtUtils getLangCode:self.selectedLanguage]);
    
    NSLog(@"Selected language saved.");
    [self.tableView reloadData];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // then back to settings window
    [self performSegueWithIdentifier: @"backToSettingsViewAfterLanguageChanged" sender: self];
}


@end
