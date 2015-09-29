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

@end
