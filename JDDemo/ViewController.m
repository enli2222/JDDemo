//
//  ViewController.m
//  JDDemo
//
//  Created by 蔡少武 on 15/9/29.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "ViewController.h"
#import "JDUtils.h"

@interface ViewController ()
- (IBAction)clickButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
    NSString *str = @"string";
    JDLog(@"%@",[str jd_MD5]);
}
@end
