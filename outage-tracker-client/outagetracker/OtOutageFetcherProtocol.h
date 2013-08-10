//
//  OtOutageFetcherProtocol.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OtOutageFetcherProtocol <NSObject>

- (void) getOutages:(void (^)(NSMutableArray *outages))onCompleteSend;

@end
