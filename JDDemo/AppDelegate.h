//
//  AppDelegate.h
//  JDDemo
//
//  Created by 蔡少武 on 15/9/29.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/**
 *  AppDelegate单例
 *
 *  @return 返回AppDelegate单例
 */
+ (AppDelegate*)sharedInstance;

/**
 *  获得当前navigation controller(storyboard下未测试)
 *
 *  @return 返回当前navigation controller
 */
- (UINavigationController*)currentNavigationController;

/**
 *  获得当前controller(storyboard下未测试)
 *
 *  @return 返回当前controller
 */
- (UIViewController*)currentViewController;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

@end

