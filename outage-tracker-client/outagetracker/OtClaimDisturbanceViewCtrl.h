//
//  OtClaimDisturbanceViewCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/27/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//


@interface OtClaimDisturbanceViewCtrl : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *approveButton;
@property (strong, nonatomic) IBOutlet UILabel *claimDisturbanceNotice;
@property (strong, nonatomic) IBOutlet UIButton *houseImageButton;

-(IBAction)showSideMenu:(id)sender;
-(IBAction)claimDisturbance:(UIButton *)sender;
-(IBAction)changeHouseImage:(UIButton *)sender;

@end
