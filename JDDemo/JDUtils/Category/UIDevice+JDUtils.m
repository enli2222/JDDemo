//
//  UIDevice+JDUtils.m
//  WorryClient
//
//  Created by 蔡少武 on 15/10/26.
//  Copyright © 2015年 jiandan. All rights reserved.
//

#import "UIDevice+JDUtils.h"
#import <sys/types.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation UIDevice (JDUtils)

static NSString *jdModelTmp;
- (NSString *)jdModel {
    if (!jdModelTmp) {
        NSDictionary *dict = @{ @"iPhone1,1" : @"iPhone 2G",
                                @"iPhone1,2" : @"iPhone 3G",
                                @"iPhone2,1" : @"iPhone 3GS",
                                @"iPhone3,1" : @"iPhone 4",
                                @"iPhone3,2" : @"iPhone 4",
                                @"iPhone3,3" : @"iPhone 4",
                                @"iPhone4,1" : @"iPhone 4s",
                                @"iPhone5,1" : @"iPhone 5",
                                @"iPhone5,2" : @"iPhone 5",
                                @"iPhone5,3" : @"iPhone 5c",
                                @"iPhone5,4" : @"iPhone 5c",
                                @"iPhone6,1" : @"iPhone 5s",
                                @"iPhone6,2" : @"iPhone 5s",
                                @"iPhone7,1" : @"iPhone 6 Plus",
                                @"iPhone7,2" : @"iPhone 6",
                                @"iPhone8,1" : @"iPhone 6s",
                                @"iPhone8,2" : @"iPhone 6s Plus",
                                
                                @"iPod1,1" : @"iPod Touch 1G",
                                @"iPod2,1" : @"iPod Touch 2G",
                                @"iPod3,1" : @"iPod Touch 3G",
                                @"iPod4,1" : @"iPod Touch 4G",
                                @"iPod5,1" : @"iPod Touch 5G",
                                
                                @"iPad1,1" : @"iPad 1G",
                                
                                @"iPad2,2" : @"iPad 2",
                                @"iPad2,3" : @"iPad 2",
                                @"iPad2,4" : @"iPad 2",
                                @"iPad2,5" : @"iPad Mini 1G",
                                @"iPad2,6" : @"iPad Mini 1G",
                                @"iPad2,7" : @"iPad Mini 1G",
                                
                                @"iPad3,1" : @"iPad 3",
                                @"iPad3,2" : @"iPad 3",
                                @"iPad3,3" : @"iPad 3",
                                @"iPad3,4" : @"iPad 4",
                                @"iPad3,5" : @"iPad 4",
                                @"iPad3,6" : @"iPad 4",
                                
                                @"iPad4,1" : @"iPad Air",
                                @"iPad4,2" : @"iPad Air",
                                @"iPad4,3" : @"iPad Air",
                                @"iPad4,4" : @"iPad Mini 2G",
                                @"iPad4,5" : @"iPad Mini 2G",
                                @"iPad4,6" : @"iPad Mini 2G",
                                
                                @"i386" : @"iPhone Simulator",
                                @"x86_64" : @"iPhone Simulator"
                                };
        NSString *platform = [self platform];
        jdModelTmp = [dict objectForKey:platform];
    }
    return jdModelTmp;
}

- (NSString *)platform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}



@end
