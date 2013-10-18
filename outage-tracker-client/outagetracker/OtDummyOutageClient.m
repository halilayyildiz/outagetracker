//
//  OtDummyOutageFetcherImpl.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtDummyOutageClient.h"
#import "OtOutage.h"

@implementation OtDummyOutageClient

- (void) getOutages:(void (^)(NSMutableArray *outages))onCompleteSend
{
    static int counter = 1;
    
    NSMutableArray *newOutageList = [[NSMutableArray alloc] init];

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    OtOutage *outage1;
    NSDate *startDate1 = [dateFormatter dateFromString:@"2013-09-02 22:00:00"];
    NSDate *endDate1 = [dateFormatter dateFromString:@"2013-09-03 06:25:00"];
    outage1 = [[OtOutage alloc] initWithDesc:@"Batikent Elektrik Kesintisi" location:@"Ankara,Batikent" startDate:startDate1 endDate:endDate1 address:@"Batikent, Ankara"];
    [outage1 setNumOfAffectedCustomers:1236];
    
    OtOutage *outage2;
    NSDate *startDate2 = [dateFormatter dateFromString:@"2013-09-14 12:40:00"];
    NSDate *endDate2 = [dateFormatter dateFromString:@"2013-09-14 16:00:00"];
    outage2 = [[OtOutage alloc] initWithDesc:@"Dikmen Elektrik Kesintisi" location:@"Ankara,Dikmen" startDate:startDate2 endDate:endDate2 address:@"Dikmen, Ankara"];
    [outage2 setNumOfAffectedCustomers:2508];
    
    
    for (int i=0; i<counter; i++) {
        if(i%2){
            [newOutageList addObject:outage1];
        }else{
            [newOutageList addObject:outage2];
        }
    }

    counter++;
    
    onCompleteSend(newOutageList);
}

- (void) registerWithInstallationId:(NSString *)installationId notify:(void (^)(NSString *userId))onComplete
{
    //TODO
    
    
    
    
}

@end
