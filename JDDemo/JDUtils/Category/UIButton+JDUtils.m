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

//来源于：http://my.oschina.net/sayonala/blog/198376
- (void)jd_transToVerticalWithPadding:(CGFloat)padding {
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // get the height they will take up as a unit
    CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
}

- (void)jd_transToVertical {
    return [self jd_transToVerticalWithPadding:3.0f];
}

@end
