//
//  UIView+JDUtils.h
//  JDUtils
//
//  Created by 蔡少武 on 15/9/23.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JDUtils)

/**
 *  顶角设置成圆角
 */
- (void)jd_setRoundCorner;

/**
 *  顶角设置弧度
 *
 *  @param radius 弧度
 */
- (void)jd_setRoundCornerWithRadius:(CGFloat)radius;

/**
 *  设置成圆形
 */
- (void)jd_setAsRound;

/**
 *  左右边缘圆角
 */
- (void)jd_setHalfRoundCorner;

@end
