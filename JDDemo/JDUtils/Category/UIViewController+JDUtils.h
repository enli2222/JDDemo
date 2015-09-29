//
//  UIViewController+JDUtils.h
//  JDUtils
//
//  Created by 蔡少武 on 15/9/23.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JDUtils)

/**
 *  根据标题，设置导航栏最右边按钮
 *
 *  @param title  按钮标题
 *  @param target 执行action的对象
 *  @param action 动作
 */
- (void)jd_addRightButtonWithTitle:(NSString *)title
                            target:(id)target
                            action:(SEL)action;
/**
 *  根据图片，设置导航栏最右边按钮
 *
 *  @param imageName 按钮图片名
 *  @param target    执行action的对象
 *  @param action    动作
 */
- (void)jd_addRightButtonWithImageName:(NSString *)imageName
                                target:(id)target
                                action:(SEL)action;

@end
