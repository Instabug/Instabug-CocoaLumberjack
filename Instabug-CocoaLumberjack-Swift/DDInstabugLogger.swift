//
//  InstabugLogger.swift
//  Figure8
//
//  Created by Rotem Itzhak on 12/03/2017.
//  Copyright © 2017 Filios inc. All rights reserved.
//

import Foundation
import CocoaLumberjackSwift
import Instabug

public class InstabugLogger : DDAbstractLogger
{
    public static let sharedInstance = InstabugLogger()
    
    override public func log(message logMessage: DDLogMessage) {
        var message: String? = logMessage.message
            
        let ivar = class_getInstanceVariable(object_getClass(self), "_logFormatter")
        if let formatter = object_getIvar(self, ivar) as? DDLogFormatter {
           message = formatter.format(message: logMessage)
        }
            
        if let msg = message {
            switch logMessage.flag {
            case DDLogFlag.verbose:
                Instabug.logVerbose(msg)
                break
            case DDLogFlag.debug:
                Instabug.logDebug(msg)
                break
            case DDLogFlag.error:
                Instabug.logError(msg)
                break
            case DDLogFlag.info:
                Instabug.logInfo(msg)
                break
                case DDLogFlag.warning:
                Instabug.logWarn(msg)
                break
            default:
                Instabug.ibgLog(msg)
            }
        }
    }
}
