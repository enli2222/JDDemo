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

@end
