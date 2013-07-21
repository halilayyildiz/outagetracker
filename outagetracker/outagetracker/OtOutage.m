//
//  OtOutage.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtOutage.h"

@implementation OtOutage

-(id) initWithDesc:(NSString *)desc location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    self = [super init];
    
    if (self) {
        _desc = desc;
        _location = location;
        _startDate = startDate;
        _endDate = endDate;
        return self;
    }
    return nil;
}

@end
