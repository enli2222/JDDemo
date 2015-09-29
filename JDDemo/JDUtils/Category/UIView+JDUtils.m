//
//  UIView+JDUtils.m
//  JDUtils
//
//  Created by 蔡少武 on 15/9/23.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "UIView+JDUtils.h"

@implementation UIView (JDUtils)

static const CGFloat kRadius = 4;  //  if is ipad,should be 8

- (void)jd_setRoundCorner {
    [self jd_setRoundCornerWithRadius:kRadius];
}

- (void)jd_setRoundCornerWithRadius:(CGFloat)radius {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}

- (void)jd_setAsRound {
    [self.layer setCornerRadius:CGRectGetWidth(self.frame)/2];
    [self.layer setMasksToBounds:YES];
    self.clipsToBounds = YES;
}

- (void)jd_setHalfRoundCorner {
    [self jd_setRoundCornerWithRadius:CGRectGetHeight(self.frame)/2];
}

@end
