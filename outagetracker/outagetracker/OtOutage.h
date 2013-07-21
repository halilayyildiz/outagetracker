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
@property (nonatomic, copy) NSDate *date;

-(id) initWithDesc:(NSString *) name location:(NSString *) location date:(NSDate *)date;

@end
