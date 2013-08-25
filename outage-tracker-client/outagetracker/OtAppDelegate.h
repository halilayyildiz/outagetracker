//
//  OtAppDelegate.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenuContainerViewController.h"

@interface OtAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MFSideMenuContainerViewController *container;

@property (nonatomic,retain ) IBOutlet UINavigationController *navCtrl;

@end
