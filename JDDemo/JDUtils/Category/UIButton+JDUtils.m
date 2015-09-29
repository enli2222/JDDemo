//
//  UIButton+JDUtils.m
//  JDUtils
//
//  Created by 蔡少武 on 15/9/23.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "UIButton+JDUtils.h"

@implementation UIButton (JDUtils)

+ (UIButton *)jd_buttonWithNormalImageName:(NSString *)normalImageName
                        highlightImageName:(NSString *)highlightImageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *highlightImage = [UIImage imageNamed:highlightImageName];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    return button;
}

+ (UIButton *)jd_buttonWithNormalImageName:(NSString *)normalImageName
                         selectedImageName:(NSString *)selectedImageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *highlightImage = [UIImage imageNamed:selectedImageName];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateSelected];
    return button;
}

+ (UIButton *)jd_buttonWithNormalTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    return button;
}


@end
