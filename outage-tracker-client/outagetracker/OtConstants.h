//
//  OtConstants.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#ifdef DEBUG
#define serverHost        @"localhost"
#define serverPort        @"3000"
#else
#define serverHost        @"halilayyildiz.com"
#define serverPort        @"3000"
#endif

#define apiHttpPrefix     @"http://"
#define apiGetAllOutages  @"/api/outage"



#import <Foundation/Foundation.h>

@interface OtConstants : NSObject

@end
