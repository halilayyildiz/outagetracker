//
//  OtOutage.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtOutage.h"

@implementation OtOutage

-(id) initWithDesc:(NSString *)description location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate address:(NSString *)addresss
{
    self = [super init];
    
    if (self) {
        _description = description;
        _location = location;
        _startDate = startDate;
        _endDate = endDate;
        _address = addresss;
        return self;
    }
    return nil;
}

@end
