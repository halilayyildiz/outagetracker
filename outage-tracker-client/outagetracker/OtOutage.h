//
//  OtOutage.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OtOutage : NSObject

@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSDate *startDate;
@property (nonatomic, copy) NSDate *endDate;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) NSInteger numOfAffectedCustomers;

-(id) initWithDesc:(NSString *) desc location:(NSString *) location startDate:(NSDate *)startDate endDate:(NSDate *)endDate address:(NSString *)addresss;

@end
