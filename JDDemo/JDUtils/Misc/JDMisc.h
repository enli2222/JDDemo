//
//  JDMisc.h
//  JDUtils
//
//  Created by 蔡少武 on 15/9/22.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef DEBUG

#define JDLog(format, ...) ([JDMisc output:__FILE__ lineNumber:__LINE__ input:(format), ## __VA_ARGS__])

#else

#define JDLog(format, ...)

#endif

/**
 *  根据整数类型的RGB值，获取不透明颜色
 *
 *  @param iRed   整数类型的Red值
 *  @param iGreen 整数类型的Green值
 *  @param iBlue  整数类型的Blue值
 *
 *  @return 不透明颜色
 */
#define jd_RGB(iRed,iGreen,iBlue)  [UIColor colorWithRed:iRed/255.0 green:iGreen/255.0 blue:iBlue/255.0 alpha:1]

@interface JDMisc : NSObject

/**
 *  首次启动设置
 */
+ (void)jd_launchSetup;

/**
 *  判断是否首次启动
 *
 *  @return 是否首次启动
 */
+ (BOOL)jd_isFirstLaunch;

/**
 *  打印日志
 *
 *  @param fileName   文件名
 *  @param lineNumber 哪一行
 *  @param input      内容
 */
+ (void)jd_output:(const char*)fileName
       lineNumber:(int)lineNumber
            input:(NSString*)input, ...;


@end
