//
//  OtAlertViewDelegate.m
//  outagetracker
//
//  Created by Halil AYYILDIZ on 10/19/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "OtAlertViewDelegate.h"

@implementation OtAlertViewDelegate
@synthesize callback;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    callback(buttonIndex);
}

+ (void)showAlertView:(UIAlertView *)alertView
         withCallback:(AlertViewCompletionBlock)callback {
    __block OtAlertViewDelegate *delegate = [[OtAlertViewDelegate alloc] init];
    alertView.delegate = delegate;
    delegate.callback = ^(NSInteger buttonIndex) {
        callback(buttonIndex);
        alertView.delegate = nil;
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-retain-cycles"
        delegate = nil;
        #pragma clang diagnostic pop
    };
    [alertView show];
}

@end
