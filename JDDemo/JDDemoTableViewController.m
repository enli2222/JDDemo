//
//  JDDemoTableViewController.m
//  JDDemo
//
//  Created by 蔡少武 on 15/11/13.
//  Copyright © 2015年 jiandan. All rights reserved.
//

#import "JDDemoTableViewController.h"
#import "JDNetworkRequest.h"

@interface JDDemoTableViewController ()<JDNetworkRequestDatasource>
@property (nonatomic, copy) NSArray *titles;
@end

@implementation JDDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[ @"网络请求例子"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            //网络请求例子
            JDNetworkRequest *networkRequest = [[JDNetworkRequest alloc]init];
            networkRequest.datasource = self;
            //TODO: 以下网址及参数是无效的，请自行更换
            NSString *urlString = @"http://www.example.com/?_c=thread&_a=threadInfo";
            NSDictionary *parameters = @{ @"msg_id" : @0,
                                          @"sign" : @"149f7fd34ba2a961ab52ac0225da7f6c",
                                          @"time" : @"1447414060",
                                          @"token" : @"FMXa++Q0Lwkue+Mdirr6lw==",
                                          @"thread_id" : @"198"
                                          };
            [networkRequest jd_requestWithURLString:urlString
                                         parameters:parameters
                                               type:JDNetworkRequestTypePost
                                        resultBlock:^(id responseObject, NSError *error) {
                                            NSLog(@"%@",responseObject);
                                        }];
            break;
        }
        default:
            break;
    }
}

#pragma mark - JDNetworkRequestDatasource

- (NSString *)jdNetworkRequestBaseURLString {
    //TODO: 网址是无效的，请自行更换
    return @"http://www.example.com";
}

@end
