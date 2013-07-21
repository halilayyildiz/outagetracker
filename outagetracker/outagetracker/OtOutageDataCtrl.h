//
//  OtOutageDataCtrl.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OtOutage;

@interface OtOutageDataCtrl : NSObject

@property (nonatomic, copy) NSMutableArray *outageList;

- (NSUInteger) getOutageCount;
- (OtOutage *) getOutageAtIndex:(NSUInteger)index;
- (void) addOutage:(OtOutage *)outage;

- (void) reloadOutages;

@end
