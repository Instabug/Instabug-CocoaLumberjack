# Instabug-CocoaLumberjack
## Installation
Add pod `Instabug-CocoaLumberjack` to your `podfile`

## Requirements
iOS version >= 8.0

`Instabug` version >= 6.2

## Example
Make sure you import our destination first: `#import <Instabug-CocoaLumberjack/DDInstabugLogger.h>`

```
DDInstabugLogger *ibgLogger = [[DDInstabugLogger alloc] init];
[DDLog addLogger:ibgLogger];

DDLogVerbose(@"Verbose");
DDLogDebug(@"Debug");
DDLogInfo(@"Info");
DDLogWarn(@"Warn");
DDLogError(@"Error");
```
