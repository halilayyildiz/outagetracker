//
//  OtMasterViewOutageCell.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/4/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface OtMasterViewOutageCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *description;
@property (nonatomic, weak) IBOutlet UILabel *startDate;
@property (nonatomic, weak) IBOutlet UILabel *duration;
@property (nonatomic, weak) IBOutlet UILabel *numOfAffectedCustomers;

@end
