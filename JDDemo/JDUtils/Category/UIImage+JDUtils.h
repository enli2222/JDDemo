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

/**
 *  获得缩略图
 *
 *  @param size 缩略图大小
 *
 *  @return 缩略图
 */
- (UIImage *)jd_scaleToSize:(CGSize)size;

/**
 *  根据颜色创建图片
 *
 *  @param color 图片颜色
 *
 *  @return 图片
 */
+ (UIImage *)jd_imageWithColor:(UIColor *)color;

/**
 *  截取图片
 *
 *  @param rect 位置、大小
 *
 *  @return 图片
 */
- (UIImage *)jd_trimWithRect:(CGRect)rect;

/**
 *  获得旋转后的图片
 *
 *  @param imageName   图片名
 *  @param orientation 旋转方向
 *
 *  @return 旋转后图片
 */
+ (UIImage *)jd_rotateImageWithImageName:(NSString *)imageName orientation:(UIImageOrientation)orientation;

@end
