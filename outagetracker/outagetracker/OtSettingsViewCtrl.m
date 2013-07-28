//
//  OtSettingsViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/28/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

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
    
    // load user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *instId = [defaults valueForKey:@"installationId"];
    self.installationId.text = instId;
    NSLog(@"User settings loaded.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)hideKeyboard:(id)sender forEvent:(UIEvent *)event {
    
    // TODO
    
}
@end
