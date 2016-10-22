//
//  LMHttpTool.h
//  Zhongliang
//
//  Created by 刘明 on 16/7/18.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import "LMPostParaments.h"

typedef enum : NSUInteger {
    StatusUnknown = 0,//未知状态
    StatusNotReachable,//无网状态
    StatusReachableViaWWAN,//手机网络
    StatusReachableViaWiFi,//Wifi网络
} LMNetworkStatus;

@interface  LMHttpTool: NSObject

typedef void (^success)(id response);
typedef void (^failure)(NSError *error);

@property (nonatomic, copy) NSString *baseUrl;

@property (nonatomic, copy) NSString *networkStatus;

@property (nonatomic, assign) NSTimeInterval timeOutInterval;

+ (instancetype)shared;

+ (LMNetworkStatus)startNetworkMonitoring;

+ (void)stopNetworkMonitoring;

- (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(success)success
     failure:(failure)failure;

- (void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(success)success
   failure:(failure)failure;


- (void)getWithForm:(NSString *)restPath
        parameters:(id)parameters
        modelClass:(Class)modelClass
           keyPath:(NSString *)keyPath
           success:(success)success
           failure:(failure)failure;


- (void)postWithForm:(NSString *)restPath
         parameters:(id)parameters
         modelClass:(Class)modelClass
            keyPath:(NSString *)keyPath
            success:(success)success
            failure:(failure)failure;

- (void)postImageWithUrlString:(NSString *)urlString
                     parament:(id)paraments
                postParaments:(LMPostParaments *)postParaments
                      success:(success)success
                      failure:(failure)failure;


- (void)synchronizationForRequestType:(NSString *)requestType
                            urlString:(NSString *)urlString
                            parameter:(id)parameter
                           controller:(UIViewController *)viewController
                              success:(success)success
                              failure:(failure)failure;


@end
