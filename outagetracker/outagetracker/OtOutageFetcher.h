//
//  OtOutageFecther.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OtOutageFetcher <NSObject>

- (NSMutableArray *) getOutages;

@end
