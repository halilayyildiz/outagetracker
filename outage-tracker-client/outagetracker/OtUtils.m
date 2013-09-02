//
//  OtConstants.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/4/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtUtils.h"

@implementation OtUtils

+ (NSString*)durationBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSTimeInterval distanceBetweenDates = [toDateTime timeIntervalSinceDate:fromDateTime];
    
    NSMutableString* durationString = [NSMutableString string];
    
    [durationString appendString:[NSString stringWithFormat:@"%i", (NSInteger)distanceBetweenDates / 3600 ]];
    [durationString appendString:@" saat "];
    [durationString appendString:[NSString stringWithFormat:@"%i ",((NSInteger)distanceBetweenDates % 3600) / 60]];
    [durationString appendString:@" dakika "];
 
    return durationString;
}

+ (NSString*)formatDate:(NSDate*) date
{
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd MMMM YYYY";
    }

    return [formatter stringFromDate:date];
}

+ (NSDate *)parseDateTime:(NSString *) dateString
{
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    
    return [formatter dateFromString:dateString];
}

+ (NSString *)getLangCode:(NSString *) language
{
    if ([language isEqualToString:@"English"])
    {
        return @"en";
    }
    else if ([language isEqualToString:@"Turkish"])
    {
        return @"tr";
    }
    else if ([language isEqualToString:@"İngilizce"])
    {
        return @"en";
    }
    else if ([language isEqualToString:@"Türkçe"])
    {
        return @"tr";
    }
    else
    {
        return @"en";
    }
}

@end
