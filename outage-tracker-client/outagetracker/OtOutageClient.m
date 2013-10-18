//
//  OtOutageFetcher.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 7/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtOutage.h"
#import "OtOutageClient.h"
#import "AFNetworking.h"

@interface OtOutageClient()

- (NSMutableArray *)parseOutage:(NSArray *)outagesJSON;
- (NSString *)parseUserId:(NSDictionary *)userJSON;
- (NSString *)getDeviceToken;

@end

@implementation OtOutageClient

- (void) getOutages:(void (^)(NSMutableArray *outages))onCompleteSend {
    
    // prepare url string
    NSString *urlStr = [NSString stringWithFormat:@"http://%@:%@%@", SERVER_HOSTNAME, SERVER_PORT, API_ALL_OUTAGES_PATH];
    
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

- (void) registerWithInstallationId:(NSString *)installationId notify:(void (^)(NSString *userId))onComplete;
{
    // prepare url string
    NSString *urlStr = [NSString stringWithFormat:@"http://%@:%@%@", SERVER_HOSTNAME, SERVER_PORT, API_REGISTER_USER_PATH];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSDictionary *params = @{API_REGISTER_USER_PARAM_INST: installationId, API_REGISTER_USER_PARAM_PUSH: [self getDeviceToken]};
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:urlStr parameters:params];
    
    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
             success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
             {
                 NSString *userId = [self parseUserId:JSON];
                 onComplete(userId);
             }
             failure:^(NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON)
             {
                 NSLog(@"User Registration Failed: %@",[error localizedDescription]);
                  onComplete(nil);
             }];
    
    [operation start];
}

- (NSMutableArray *)parseOutage:(NSArray *)outagesJSON
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for(NSDictionary *outageJson in outagesJSON)
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

- (NSString *)parseUserId:(NSDictionary *)userJSON
{
    NSInteger userId = [userJSON[@"id"] integerValue];
    return [NSString stringWithFormat:@"%d", userId];
}

- (NSString *)getDeviceToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults valueForKey:OT_PUSH_TOKEN];
    if (token == nil) {
        return @"";
    }
    return token;
}

@end
