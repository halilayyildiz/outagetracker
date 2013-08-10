//
//  OtOutageFetcher.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtUtils.h"
#import "OtOutage.h"
#import "OtOutageFetcher.h"
#import "AFNetworking.h"

@interface OtOutageFetcher()

-(NSMutableArray *)parseOutage:(NSArray *)outagesJson;

@end

@implementation OtOutageFetcher

- (void) getOutages:(void (^)(NSMutableArray *outages))onCompleteSend {
    
    // prepare url string
    NSString *urlStr = [NSString stringWithFormat:@"http://%@:%@%@", serverHost, serverPort, apiGetAllOutages];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                
                NSMutableArray *outages = [self parseOutage:JSON];
                onCompleteSend(outages);
            }
            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Outages"
                                                             message:[NSString stringWithFormat:@"%@",error]
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [av show];
            }
        ];
    
    [operation start];
}

- (NSMutableArray *)parseOutage:(NSArray *)outagesJson
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for(NSDictionary *outageJson in outagesJson)
    {
        OtOutage *outage = [[OtOutage alloc] init];
        
        [outage setDescription:outageJson[@"description"]];
        [outage setLocation:outageJson[@"location"]];
        [outage setStartDate:[OtUtils parseDateTime:outageJson[@"start_date"]]];
        [outage setEndDate:[OtUtils parseDateTime:outageJson[@"end_date"]]];
        [outage setNumOfAffectedCustomers:[outageJson[@"affected_customers"] intValue]];
        [outage setDescription:outageJson[@"description"]];
        
        [result addObject:outage];
    }
    
    return result;
}

@end
