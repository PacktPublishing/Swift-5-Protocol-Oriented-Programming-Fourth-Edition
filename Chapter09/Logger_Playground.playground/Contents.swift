import Cocoa

protocol  LoggerProfile  {
    var  loggerProfileId:  String  {get}
    func  writeLog(level:  String,  message:  String)
}

extension  LoggerProfile  {
    func  getCurrentDateString()  ->  String{
        let  date  =  Date()
        let  dateFormatter  =  DateFormatter()
        dateFormatter.dateFormat  =  "MM/dd/yyyy  hh:mm"
        return  dateFormatter.string(from:  date)
    }
}

struct  LoggerNull:  LoggerProfile  {
    let  loggerProfileId  =  "hoffman.jon.logger.null"
    func  writeLog(level:  String,  message:  String)  {
        //  Do  nothing
    }
}

struct  LoggerConsole:  LoggerProfile  {
    let  loggerProfileId  =  "hoffman.jon.logger.console"
    func  writeLog(level:  String,  message:  String)  {
        let  now  =  getCurrentDateString()
        print("\(now):  \(level)  -  \(message)")
    }
}

enum  LogLevels:  String  {
    case  fatal
    case  error
    case  warn
    case  debug
    case  info
    
    static  let  allValues  =  [fatal,  error,  warn,  debug,  info]
}

protocol  Logger  {
    static  var  loggers:  [LogLevels:[LoggerProfile]]  {get  set}
    static  func  writeLog(logLevel:  LogLevels,  message:  String)
}


extension Logger {
    static  func  logLevelContainsProfile(logLevel:  LogLevels,  loggerProfile: LoggerProfile) ->  Bool {
        if  let  logProfiles  =  loggers[logLevel]  {
            for  logProfile  in  logProfiles  where logProfile.loggerProfileId  == loggerProfile.loggerProfileId  {
                return  true
            }
        }
        return  false
    }
    
    static  func  setLogLevel(logLevel:  LogLevels,  loggerProfile:  LoggerProfile)
    {
        
        if  let  _  =  loggers[logLevel]  {
            if  !logLevelContainsProfile(logLevel:  logLevel, loggerProfile:  loggerProfile)  {
                loggers[logLevel]?.append(loggerProfile)
            }
        }  else  {
            var  a  =  [LoggerProfile]()
            a.append(loggerProfile)
            loggers[logLevel]  =  a
        }
    }
    
    static  func  addLogProfileToAllLevels(  defaultLoggerProfile:  LoggerProfile)
    {
        for  level  in  LogLevels.allValues  {
            setLogLevel(logLevel:  level,  loggerProfile:  defaultLoggerProfile)
        }
    }

    static  func  removeLogProfileFromLevel(logLevel:  LogLevels,  loggerProfile: LoggerProfile)  {
        if  var  logProfiles  =  loggers[logLevel]  {
            if  let  index  =  logProfiles.firstIndex(where: {$0.loggerProfileId  ==  loggerProfile.loggerProfileId})  {
                logProfiles.remove(at:  index)
            }
            loggers[logLevel]  =  logProfiles
        }
    }

    static  func  removeLogProfileFromAllLevels(loggerProfile:  LoggerProfile)  {
        for  level  in  LogLevels.allValues  {
            removeLogProfileFromLevel(logLevel:  level, loggerProfile:  loggerProfile)
        }
    }

    static  func  hasLoggerForLevel(logLevel:  LogLevels)  ->  Bool  {
        guard  let  _  =  loggers[logLevel]  else  {
            return  false
        }
        return  true
    }

}

struct  MyLogger:  Logger  {
    static  var  loggers  =  [LogLevels:  [LoggerProfile]]()
    static  func  writeLog(logLevel:  LogLevels,  message:  String)  {
        guard  hasLoggerForLevel(logLevel:  logLevel)  else  {
            print("No  logger")
            return
        }
        if  let  logProfiles  =  loggers[logLevel]  {
            for  logProfile  in  logProfiles  {
                logProfile.writeLog(level:  logLevel.rawValue,  message:  message)
            }
        }
    }
}

MyLogger.addLogProfileToAllLevels(defaultLoggerProfile: LoggerConsole())
MyLogger.writeLog(logLevel: LogLevels.debug, message: "Debug Message 1")
MyLogger.writeLog(logLevel:  LogLevels.error,  message:  "Error  Message  1")


