//
//  UINavigationController+JDUtils.h
//  JDDemo
//
//  Created by 蔡少武 on 15/11/8.
//  Copyright © 2015年 jiandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (JDUtils)

/**
 *  hide bottom bar when push
 *
 *  @param viewController the view controller want to push
 *  @param animated push with animation
 */
- (void)jd_pushViewController:(UIViewController *)viewController
                     animated:(BOOL)animated;
@end
