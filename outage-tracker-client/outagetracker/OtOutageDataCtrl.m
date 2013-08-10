//
//  OtOutageDataCtrl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtOutage.h"
#import "OtOutageDataCtrl.h"
#import "OtOutageClient.h"
#import "OtDummyOutageClient.h"


@interface OtOutageDataCtrl()

@property () id<OtOutageClientProtocol> outageClient;

@end

@implementation OtOutageDataCtrl


- (id)init
{
    if (self = [super init])
    {
        if(self.outageClient == nil)
        {
            self.outageClient = [[OtOutageClient alloc] init];
        }
        return self;
    }
    return nil;
}

// to avoid setting immutable list
- (void) setOutageList:(NSMutableArray *) newList
{
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

- (void) reloadOutagesAndNotify:(void (^) (void))onComplete
{
    self.outageList = [[NSMutableArray alloc] init];
    [self.outageClient getOutages:^(NSMutableArray *outages) {
        for (OtOutage *outage in outages) {
            [self.outageList addObject:outage];
        }
        
        onComplete();
    }];
}

@end
