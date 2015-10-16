//
//  UIButton+JDUtils.h
//  JDUtils
//
//  Created by 蔡少武 on 15/9/23.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JDUtils)

+ (UIButton *)jd_buttonWithNormalImageName:(NSString *)normalImageName
                     highlightImageName:(NSString *)highlightImageName;

+ (UIButton *)jd_buttonWithNormalImageName:(NSString *)normalImageName
                      selectedImageName:(NSString *)selectedImageName;

+ (UIButton *)jd_buttonWithNormalTitle:(NSString *)title;


//以下2个方法，须在设置图片和标题之后使用
/**
 *  将按钮转换为竖直样式：图片在上，标题在下
 */
- (void)jd_transToVertical;

/**
 *  将按钮转换为竖直样式：图片在上，标题在下
 *
 *  @param padding 图片与标题间距
 */
- (void)jd_transToVerticalWithPadding:(CGFloat)padding;

@end
