//
//  JDNetworkRequest.m
//  JDDemo
//
//  Created by 蔡少武 on 15/11/11.
//  Copyright © 2015年 jiandan. All rights reserved.
//

#import "JDNetworkRequest.h"
#import "JDUtils.h"
#import "AFNetworking.h"

@interface JDNetworkRequest ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, assign, getter=isConnected) BOOL connected;   /**<网络是否连接*/
@end

@implementation JDNetworkRequest

- (void)jd_requestWithURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                           type:(JDNetworkRequestType)type
                    resultBlock:(JDNetworkRequestResultBlock)resultBlock {
    if (!self.isConnected) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示"
                                                           message:@"没有网络,建议在手机设置中打开网络"
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"退出", nil];
        [alertView show];
        return;
    }
    if (![self.datasource respondsToSelector:@selector(jdNetworkRequestBaseURLString)]) {   //未实现datasource
        JDLog(@"error:未实现JDNetworkRequestDatasource");
        return;
    }
    
    NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                     @"text/html",
                                     @"text/json",
                                     @"text/javascript",
                                     @"text/plain", nil];
    
    self.manager.operationQueue.maxConcurrentOperationCount = 5;
    self.manager.requestSerializer.timeoutInterval = 3;
    self.manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    
    switch (type) {
        case JDNetworkRequestTypePost: {
            [self.manager POST:urlString
                    parameters:parameters
                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                           [self handleRequestResultWithDataTask:task
                                                  responseObject:responseObject
                                                           error:nil
                                                     resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:error
                                          resultBlock:resultBlock];
            }];
            break;
        }
        case JDNetworkRequestTypeGet: {
            [self.manager GET:urlString
                   parameters:parameters
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                          [self handleRequestResultWithDataTask:task
                                                 responseObject:responseObject
                                                          error:nil
                                                    resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:error
                                          resultBlock:resultBlock];
            }];
            break;
        }
        case JDNetworkRequestTypePut: {
            [self.manager PUT:urlString
                   parameters:parameters
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                        [self handleRequestResultWithDataTask:task
                                               responseObject:responseObject
                                                        error:nil
                                                  resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:error
                                          resultBlock:resultBlock];
            }];
            break;
        }
        case JDNetworkRequestTypeHead: {
            [self.manager HEAD:urlString
                    parameters:parameters
                       success:^(NSURLSessionDataTask * _Nonnull task) {
                           [self handleRequestResultWithDataTask:task
                                                  responseObject:nil
                                                           error:nil
                                                     resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:error
                                          resultBlock:resultBlock];
            }];
            break;
        }
        case JDNetworkRequestTypeDelete:{
            [self.manager DELETE:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:nil
                                          resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:error
                                          resultBlock:resultBlock];
            }];
            break;
        }
    }
}

- (BOOL)isConnected {
    struct sockaddr zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sa_len = sizeof(zeroAddress);
    zeroAddress.sa_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability =
    SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags =
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        printf("Error. Count not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        NSString *baseUrlString = [self.datasource jdNetworkRequestBaseURLString];
        _manager = [[AFHTTPSessionManager alloc]
                    initWithBaseURL:[NSURL URLWithString:baseUrlString]];
    }
    return _manager;
}

- (void)handleRequestResultWithDataTask:(NSURLSessionDataTask *)task
                         responseObject:(id)responseObject
                                  error:(NSError *)error
                            resultBlock:(JDNetworkRequestResultBlock)resultBlock {
    //do something here...
    JD_EXECUTE_BLOCK(resultBlock,responseObject,error);
}

@end
