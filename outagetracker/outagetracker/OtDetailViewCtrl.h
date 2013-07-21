//
//  OtDetailViewController.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OtOutage;

@interface OtDetailViewCtrl : UIViewController

@property (strong, nonatomic) OtOutage *outage;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;

@end
