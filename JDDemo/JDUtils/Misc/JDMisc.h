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

#define JDLog(format, ...) ([JDMisc jd_output:__FILE__ lineNumber:__LINE__ input:(format), ## __VA_ARGS__])

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

/**
 *  安全地执行block
 *
 *  @param A 具体的block
 */
#define JD_EXECUTE_BLOCK(A,...)            if(A != NULL) {A(__VA_ARGS__);}

/**
 *  标识废弃的方法
 *
 *  @param explain 解释，可以是建议使用的方法
 */
#define JDDeprecated(explain) __attribute__((deprecated(explain)))

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

/**
 *  显示数字，如评论数
 *
 *  @param count       数字
 *  @param maxCount    最大显示数，超过的就是maxCount++
 *  @param placeholder 数字为0时，显示。
 *
 *  @return 显示字符串
 */
+ (NSString *)jd_stringWithCount:(NSInteger)count
                        maxCount:(NSInteger)maxCount
                     placeholder:(NSString *)placeholder;

@end
