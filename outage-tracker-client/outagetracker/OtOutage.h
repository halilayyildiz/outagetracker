//
//  OtOutage.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OtOutage : NSObject

@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSDate *startDate;
@property (nonatomic, copy) NSDate *endDate;

-(id) initWithDesc:(NSString *) name location:(NSString *) location startDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
