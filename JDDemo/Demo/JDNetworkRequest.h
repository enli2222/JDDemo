//
//  JDNetworkRequest.h
//  JDDemo
//
//  Created by 蔡少武 on 15/11/11.
//  Copyright © 2015年 jiandan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDNetworkRequestDatasource <NSObject>

- (NSString *)jdNetworkRequestBaseURLString; //用于初始化的网址

@end

//网络请求类型
typedef NS_ENUM(NSUInteger,JDNetworkRequestType) {
    JDNetworkRequestTypePost,
    JDNetworkRequestTypeGet,
    JDNetworkRequestTypeHead,
    JDNetworkRequestTypePut,
    JDNetworkRequestTypeDelete
};

typedef void(^JDNetworkRequestResultBlock)(id responseObject,NSError *error);

@interface JDNetworkRequest : NSObject

@property (nonatomic, weak) id<JDNetworkRequestDatasource> datasource;

/**
 *  发送网络请求
 *
 *  @param urlString   网址字符串
 *  @param parameters  参数
 *  @param type        请求类型
 *  @param resultBlock 返回结果：responseObject,error
 */
- (void)jd_requestWithURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                           type:(JDNetworkRequestType)type
                    resultBlock:(JDNetworkRequestResultBlock)resultBlock;
@end
