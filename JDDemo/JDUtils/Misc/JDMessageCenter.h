//
//  JDMessageCenter.h
//  JDDemo
//
//  Created by 蔡少武 on 15/9/29.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface JDMessageCenter : NSObject

//单例
+ (instancetype)sharedInstance;

/**
 *  普通提示
 *
 *  @param message  提示内容
 *  @param duration 持续时间
 */
- (void)jd_HUDWithMessage:(NSString *)message duration:(NSInteger)duration;

/**
 *  成功提示
 *
 *  @param message  提示内容
 *  @param duration 持续时间
 */
- (void)jd_successHUDWithMessage:(NSString *)message duration:(NSInteger)duration;

/**
 *  错误提示
 *
 *  @param message  提示内容
 *  @param duration 持续时间
 */
- (void)jd_errorHUDWithMessage:(NSString *)message duration:(NSInteger)duration;

#define jd_HUD_Success(msg)     [[JDMessageCenter sharedInstance]jd_successHUDWithMessage:msg duration:1.5]
#define jd_HUD_Error(msg)       [[JDMessageCenter sharedInstance]jd_errorHUDWithMessage:msg duration:1.5]
#define jd_HUD(msg)             [[JDMessageCenter sharedInstance]jd_HUDWithMessage:msg duration:1.5]

@end
