//
//  OtOutageFetcherProtocol.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OtOutageClientProtocol <NSObject>

- (void) getOutages:(void (^)(NSMutableArray *outages))onCompleteSend;

- (void) registerWithInstallationId:(NSString *)installationId notify:(void (^)(NSString *userId))onComplete;

@end
