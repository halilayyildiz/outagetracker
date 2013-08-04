//
//  OtOutageDataCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtOutage.h"
#import "OtOutageDataCtrl.h"
#import "OtDummyOutageFetcherImpl.h"


@interface OtOutageDataCtrl()

@property () id<OtOutageFetcher> outageFetcher;
- (void)loadOutages;

@end

@implementation OtOutageDataCtrl


- (id)init
{
    if (self = [super init])
    {
        [self loadOutages];
        return self;
    }
    return nil;
}

-(void) loadOutages
{    
    if(self.outageFetcher == nil)
    {
        self.outageFetcher = [[OtDummyOutageFetcherImpl alloc] init];
    }
    
    self.outageList = [[NSMutableArray alloc] init];
    NSMutableArray *outages = [self.outageFetcher getOutages];
    for (OtOutage *outage in outages) {
        [self.outageList addObject:outage];
    }
}

// to avoid setting immutable list
- (void) setOutageList:(NSMutableArray *) newList {
    if (_outageList != newList) {
        _outageList = [newList mutableCopy];
    }
}

- (NSUInteger) outageCountInList
{
    return [self.outageList count];
}

- (OtOutage *) objectInListAtIndex:(NSUInteger)theIndex
{
    return [self.outageList objectAtIndex:theIndex];
}

- (void) addOutage:(OtOutage *)outage
{
    [self.outageList addObject:outage];
}

-(void) reloadOutages
{
    [self loadOutages];
}

@end
