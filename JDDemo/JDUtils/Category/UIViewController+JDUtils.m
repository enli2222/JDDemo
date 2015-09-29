//
//  UIViewController+JDUtils.m
//  JDUtils
//
//  Created by 蔡少武 on 15/9/23.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "UIViewController+JDUtils.h"

@implementation UIViewController (JDUtils)

- (void)jd_addRightButtonWithTitle:(NSString *)title
                            target:(id)target
                            action:(SEL)action {
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:title
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:target
                                                                   action:action];
    [rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)jd_addRightButtonWithImageName:(NSString *)imageName
                                target:(id)target
                                action:(SEL)action {
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName]
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:target
                                                                   action:action];
    [rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

@end
