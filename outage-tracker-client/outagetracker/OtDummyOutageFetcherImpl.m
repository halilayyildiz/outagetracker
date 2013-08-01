//
//  OtDummyOutageFetcherImpl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtDummyOutageFetcherImpl.h"
#import "OtOutage.h"

@implementation OtDummyOutageFetcherImpl

- (NSMutableArray *) getOutages {
    
    NSMutableArray *newOutageList = [[NSMutableArray alloc] init];
    
    OtOutage *outage1;
    NSDate *date1 = [NSDate date];
    outage1 = [[OtOutage alloc] initWithDesc:@"Batikent Elektrik Kesintisi" location:@"Ankara,Batikent" startDate:date1 endDate:date1];
    
    OtOutage *outage2;
    NSDate *date2 = [NSDate date];
    outage2 = [[OtOutage alloc] initWithDesc:@"Dikmen Elektrik Kesintisi" location:@"Ankara,Dikmen" startDate:date2 endDate:date2];
    
    [newOutageList addObject:outage1];
    [newOutageList addObject:outage2];

    return newOutageList;
}

@end
