//
//  OtConstants.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#ifdef DEBUG
#define SERVER_HOSTNAME                     @"localhost"
#define SERVER_PORT                         @"3000"
#else
#define SERVER_HOSTNAME                     @"halilayyildiz.com"
#define SERVER_PORT                         @"3000"
#endif

#define API_HTTP_PREFIX                     @"http://"
#define API_ALL_OUTAGES_PATH                @"/api/outages"
#define API_REGISTER_USER_PATH              @"/api/users"
#define API_REGISTER_USER_PARAM_INST        @"installation_id"

#define OT_USER_ID                          @"otUserId"
#define OT_INST_ID                          @"otInstallationId"

#define BGCOLOR                             0xD0D5DE
#define FGCOLOR                             0x30AEB3


#import <Foundation/Foundation.h>

@interface OtConstants : NSObject

@end
