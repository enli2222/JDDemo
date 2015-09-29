//
//  NSString+JDUtils.m
//  JDUtils
//
//  Created by 蔡少武 on 15/9/22.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "NSString+JDUtils.h"

@implementation NSString (JDUtils)

+ (NSString *)jd_UUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString* retStr = (__bridge_transfer NSString *)string;
    return [[retStr stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
}


- (BOOL)jd_isValid {
    return self && [self isEqualToString:@""] && [self isEqual:[NSNull null]];
}

@end
