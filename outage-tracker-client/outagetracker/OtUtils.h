//
//  OtConstants.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/4/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BGCOLOR 0xD0D5DE

@interface OtUtils : NSObject

+ (NSString*)durationBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSString*)formatDate:(NSDate*)date;

@end