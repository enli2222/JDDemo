//
//  UIImage+JDUtils.h
//  JDUtils
//
//  Created by 蔡少武 on 15/9/22.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JDUtils)

/**
 *  判断是否亮色
 *
 *  @return 返回是否亮色
 */
- (BOOL)jd_isLightColor;

/**
 *  获得主要颜色
 *
 *  @return 返回主要颜色
 */
- (UIColor *)jd_mostColor;

/**
 *  获得颜色RGB值
 *
 *  @param color 颜色
 *
 *  @return 返回颜色RGB值
 */
- (NSArray *)jd_RGBComponentsWithColor:(UIColor *)color;
@end
