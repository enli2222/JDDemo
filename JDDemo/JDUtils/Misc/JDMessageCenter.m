//
//  JDMessageCenter.m
//  JDDemo
//
//  Created by 蔡少武 on 15/9/29.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "JDMessageCenter.h"
#import "AppDelegate.h"
#import "JDUtils.h"

@implementation JDMessageCenter

+ (instancetype)sharedInstance {
    static JDMessageCenter *shareObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareObject = [[JDMessageCenter alloc]init];
    });
    return shareObject;
}

- (void)jd_HUDWithMessage:(NSString *)message duration:(NSInteger)duration {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[AppDelegate sharedInstance].window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 7.0f;
//    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    hud.color = [UIColor lightGrayColor];
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:duration];
}

- (void)jd_successHUDWithMessage:(NSString *)message duration:(NSInteger)duration {
    JDLog(@"success:%@",message);
    [self jd_HUDWithMessage:message duration:duration];
}

- (void)jd_errorHUDWithMessage:(NSString *)message duration:(NSInteger)duration {
    JDLog(@"error:%@",message);
    [self jd_HUDWithMessage:message duration:duration];
}

@end