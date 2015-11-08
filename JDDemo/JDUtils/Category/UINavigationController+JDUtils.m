//
//  UINavigationController+JDUtils.m
//  JDDemo
//
//  Created by 蔡少武 on 15/11/8.
//  Copyright © 2015年 jiandan. All rights reserved.
//

#import "UINavigationController+JDUtils.h"

@implementation UINavigationController (JDUtils)
- (void)jd_pushViewController:(UIViewController *)viewController
                     animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [self pushViewController:viewController animated:YES];
}
@end
