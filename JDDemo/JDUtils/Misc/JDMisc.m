//
//  JDMisc.m
//  JDUtils
//
//  Created by 蔡少武 on 15/9/22.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "JDMisc.h"

@implementation JDMisc

static NSString * const kEverLaunched = @"everLaunched";
static NSString * const kFirstLaunch  = @"firstLaunch";

+ (void)jd_launchSetup {
    //  判断是否首次启动应用
    if ([self jd_isFirstLaunch]) {    //  首次启动
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kEverLaunched];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kFirstLaunch];
    }else{  //  非首次启动
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kFirstLaunch];
    }
}

+ (BOOL)jd_isFirstLaunch {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:kEverLaunched];
}

+ (void)jd_output:(const char*)fileName
       lineNumber:(int)lineNumber
            input:(NSString*)input, ...
{
    va_list argList;
    NSString *filePath, *formatStr;
    
    // Build the path string
    filePath = [[NSString alloc] initWithBytes:fileName
                                        length:strlen(fileName)
                                      encoding:NSUTF8StringEncoding];
    
    // Process arguments, resulting in a format string
    va_start(argList, input);
    formatStr = [[NSString alloc] initWithFormat:input arguments:argList];
    va_end(argList);
    
    NSLog(@"%@[%d] %@", [filePath lastPathComponent], lineNumber, formatStr);
}


@end
