//
//  NSString+JDUtils.h
//  JDUtils
//
//  Created by 蔡少武 on 15/9/22.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JDUtils)

/**
 *  获得UUID
 *
 *  @return 返回uuid
 */
+ (NSString *)jd_UUID;

/**
 *  检验是否有效
 *
 *  @return 若非空且不等于@“”，则返回YES，否则，返回NO
 */
- (BOOL)jd_isValid;

/**
 *  判断是否有效邮箱
 *
 *  @return 返回是否有效
 */
- (BOOL)jd_isValidEmail;

/**
 *  判断是否有效手机号码
 *
 *  @return 返回是否有效
 */
- (BOOL)jd_isValidPhone;

/**
 *  产生MD5
 *
 *  @return MD5
 */
- (NSString *)jd_MD5;

@end
