//
//  OtAlertViewDelegate.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 10/19/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface OtAlertViewDelegate : NSObject<UIAlertViewDelegate>

typedef void (^AlertViewCompletionBlock)(NSInteger buttonIndex);
@property (strong,nonatomic) AlertViewCompletionBlock callback;

+ (void)showAlertView:(UIAlertView *)alertView withCallback:(AlertViewCompletionBlock)callback;

@end