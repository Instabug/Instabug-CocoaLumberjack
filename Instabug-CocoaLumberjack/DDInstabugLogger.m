//
//  DDInstabugLogger.m
//  Instabug Demo
//
//  Created by Yousef Hamza on 2/1/17.
//  Copyright © 2017 Instabug. All rights reserved.
//

#import "DDInstabugLogger.h"
#import <Instabug/Instabug.h>

@implementation DDInstabugLogger

+ (instancetype)sharedInstance {
    static DDInstabugLogger *sharedInstance;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[DDInstabugLogger alloc] init];
    });
    return sharedInstance;
}


- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->_message;
    if (self->_logFormatter) {
        logMsg = [self->_logFormatter formatLogMessage:logMessage];
    }

    NSUInteger flag = logMessage->_flag;

    switch (flag) {
        case DDLogFlagVerbose:
            [Instabug logVerbose:logMsg];
            break;
        case DDLogFlagDebug:
            [Instabug logDebug:logMsg];
            break;
        case DDLogFlagInfo:
            [Instabug logInfo:logMsg];
            break;
        case DDLogFlagWarning:
            [Instabug logWarn:logMsg];
            break;
        case DDLogFlagError:
            [Instabug logError:logMsg];
            break;
        default:
            [Instabug IBGLog:logMsg];
            break;
    }
}

@end
