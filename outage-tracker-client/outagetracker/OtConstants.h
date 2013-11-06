//
//  OtConstants.h
//  outagetracker
//
//  Created by Halil AYYILDIZ on 8/10/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#define API_HTTP_PREFIX                     @"http://"
#ifdef DEBUG
#define SERVER_HOSTNAME                     @"localhost"
#define SERVER_PORT                         @"3000"
#else
#define SERVER_HOSTNAME                     @"halilayyildiz.com"
#define SERVER_PORT                         @"8080"
#endif

#define API_ALL_OUTAGES_PATH                @"/outagetracker/api/outage/all"
#define API_NEW_TCALL_PATH                  @"/outagetracker/api/outage/tcall"
#define API_NEW_TCALL_PARAM_INST            @"inst_id"
#define API_REGISTER_USER_PATH              @"/outagetracker/api/user/register"
#define API_REGISTER_USER_PARAM_INST        @"inst_id"
#define API_REGISTER_USER_PARAM_PUSH        @"push_id"

#define OT_USER_ID                          @"otUserId"
#define OT_INST_ID                          @"otInstallationId"
#define OT_LANG                             @"otLanguage"
#define OT_PUSH_TOKEN                       @"otPushToken"
#define OT_HAS_DISTURBANCE                  @"otHasDisturbance"

#define BGCOLOR                             0xD0D5DE
#define FGCOLOR                             0x30AEB3
#define SIDE_VIEW_BG_COLOR                  0x454548
#define SIDE_VIEW_ETCH_LIGHT_COLOR          0x515151
#define SIDE_VIEW_ETCH_DARK_COLOR           0x393939
#define NAV_BAR_TINT_COLOR                  0xEFEFEF




#import <Foundation/Foundation.h>

@interface OtConstants : NSObject

@end
