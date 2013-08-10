//
//  OtSettingsViewCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/28/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtSettingsViewCtrl.h"
#import "OtUtils.h"

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
    
    // set styles
    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    
    // load user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *userId = [defaults valueForKey:OT_USER_ID];
    self.userId.text = userId;
    NSString *instId = [defaults valueForKey:OT_INST_ID];
    self.installationId.text = instId;
    
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    self.appVersion.text = [infoDict objectForKey:@"CFBundleVersion"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)hideKeyboard:(id)sender forEvent:(UIEvent *)event {
    
    // TODO
    NSLog(@"hide keyboard..");
    
}
@end
