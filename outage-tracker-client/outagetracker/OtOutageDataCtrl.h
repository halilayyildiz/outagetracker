//
//  OtOutageDataCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//


@class OtOutage;

@interface OtOutageDataCtrl : NSObject

@property (nonatomic, copy) NSMutableArray *outageList;

- (NSUInteger) outageCountInList;
- (OtOutage *) objectInListAtIndex:(NSUInteger)index;
- (void) addOutage:(OtOutage *)outage;

- (void) reloadOutagesAndNotify:(void (^) (void))onComplete;

@end
