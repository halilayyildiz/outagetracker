//
//  OtMasterViewOutageCell.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/4/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtMasterViewOutageCell.h"
#import "OtUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation OtMasterViewOutageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    const CGRect insetRect            = CGRectInset( self.bounds, 6, 4);
    
    self.contentView.frame            = insetRect;
    self.backgroundView.frame         = insetRect;
    self.selectedBackgroundView.frame = insetRect;
    self.contentView.backgroundColor = UIColorFromRGB(0xFFFFFF);
    self.contentView.layer.cornerRadius = 4;
}

@end
