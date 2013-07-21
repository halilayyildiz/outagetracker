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
- (void)initializeDefaultDataList;

@end

@implementation OtOutageDataCtrl


- (id)init
{
    if (self = [super init])
    {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

-(void) initializeDefaultDataList
{
    self.outageFetcher = [[OtDummyOutageFetcherImpl alloc] init];
    self.outageList = [[NSMutableArray alloc] init];
    
    for (OtOutage *outage in [self.outageFetcher getOutages]) {
        [self.outageList addObject:outage];
    }
}

// to avoid setting immutable list
- (void) setOutageList:(NSMutableArray *) newList {
    if (_outageList != newList) {
        _outageList = [newList mutableCopy];
    }
}

- (NSUInteger) getOutageCount
{
    return [self.outageList count];
}

- (OtOutage *) getOutageAtIndex:(NSUInteger)theIndex
{
    return [self.outageList objectAtIndex:theIndex];
}

- (void) addOutage:(OtOutage *)outage
{
    [self.outageList addObject:outage];
}

-(void) reloadOutages {

    // TODO

}

@end
