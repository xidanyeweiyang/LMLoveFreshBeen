//
//  LMHttpTool.m
//  Zhongliang
//
//  Created by 刘明 on 16/7/18.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHttpTool.h"
#import "MBProgressHUD+LM.h"
@implementation LMHttpTool


+ (instancetype)shared{
    
    static LMHttpTool *tool;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tool = [[LMHttpTool alloc] init];
        tool.baseUrl = kBase_IP;
        tool.timeOutInterval = 30;
        
    });
    
    return tool;
    
}

- (NSString *)getUUID{
   
    NSString *uuidStr = [SPIMyUUID load:@"KEY_DEVICE_UUID"];
    
    if ([uuidStr isEqualToString:@""] || !uuidStr) {
        
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidRef));
        
        [SPIMyUUID save:@"KEY_DEVICE_UUID" data:uuidStr];
    }
    
    return uuidStr;
}


static BOOL isExistenceNetwork = YES;


+ (LMNetworkStatus)startNetworkMonitoring{
    
    __block NSInteger statusTag = 0;
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown:{
                
                statusTag = StatusUnknown;
                break;
            }
                
            case AFNetworkReachabilityStatusNotReachable:{
                
                statusTag = StatusNotReachable;
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                
                statusTag = StatusReachableViaWiFi;
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                
                statusTag = StatusReachableViaWWAN;
                break;
            }
                
            default:
                
                break;
        }
    }];
    
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    return statusTag;
}

+(void)stopNetworkMonitoring{
    
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
    
}


- (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(success)success
     failure:(failure)failure{
    
    //网络检查
    if ([LMHttpTool startNetworkMonitoring] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败,请检查网络" ToView:nil];
        return;
    }

    URLString = [NSString stringWithFormat:@"%@%@",self.baseUrl,URLString];
    //断言
    NSAssert(URLString != nil, @"url不能为空");

//    AFHTTPSessionManager *sessionManager = [self LMHTTPSessionManager];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    
    [sessionManager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
    
}

- (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(success)success
    failure:(failure)failure{
    
    //网络检查
    if ([LMHttpTool startNetworkMonitoring] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败,请检查网络" ToView:nil];
        return;
    }
    
    URLString = [NSString stringWithFormat:@"%@%@",self.baseUrl,URLString];
    //断言
    NSAssert(URLString != nil, @"url不能为空");


    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];

//    AFHTTPSessionManager *sessionManager = [self LMHTTPSessionManager];
    
    
    [sessionManager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
    
}

- (void)getWithForm:(NSString *)restPath
         parameters:(id)parameters
         modelClass:(Class)modelClass
            keyPath:(NSString *)keyPath
            success:(success)success
            failure:(failure)failure{
    
    //网络检查
    if ([LMHttpTool startNetworkMonitoring] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败,请检查网络" ToView:nil];
        return;
    }
    
    restPath = [NSString stringWithFormat:@"%@%@",self.baseUrl,restPath];
    //断言
    NSAssert(restPath != nil, @"url不能为空");

    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];

//    AFHTTPSessionManager *sessionManager = [self LMHTTPSessionManager];
    
    
    [sessionManager GET:restPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"OK"]) {
            
            id  result;
            id  tmp;
            
            if (keyPath && ![keyPath isEqualToString:@""]) {
                tmp = [responseObject valueForKeyPath:keyPath];
            }else{
                tmp = responseObject;
            }
            
            if (modelClass) {
                
                if ([tmp isKindOfClass:[NSArray class]]) {
                    
                    
                    result = [modelClass mj_objectArrayWithKeyValuesArray:tmp];
                    
                    
                    
                }else if([tmp isKindOfClass:[NSDictionary class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }else if([tmp isKindOfClass:[NSNull class]]){
                    
                    result = nil;
                    
                }
                else if([tmp isKindOfClass:[NSObject class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                }
            }else{
                
                result = tmp;
            }
            
            
            success(result);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:@"" code:1
                                             userInfo:responseObject];
            
            failure(error);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
    
    
}

- (void)postWithForm:(NSString *)restPath
          parameters:(id)parameters
          modelClass:(Class)modelClass
             keyPath:(NSString *)keyPath
             success:(success)success
             failure:(failure)failure{
    
    //网络检查
    if ([LMHttpTool startNetworkMonitoring] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败,请检查网络" ToView:nil];
        return;
    }
    
    restPath = [NSString stringWithFormat:@"%@%@",self.baseUrl,restPath];
    //断言
    NSAssert(restPath != nil, @"url不能为空");

    
    //创建请求url
//    AFHTTPSessionManager *sessionManager = [self LMHTTPSessionManager];
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];

    //    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [sessionManager POST:restPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"__responseObject_%@",responseObject);
        
        if ([responseObject[@"status"] isEqualToString:@"OK"]) {
            
            id  result;
            id  tmp;
            
            if (keyPath && ![keyPath isEqualToString:@""]) {
                tmp = [responseObject valueForKeyPath:keyPath];
            }else{
                tmp = responseObject;
            }
            
            if (modelClass) {
                
                if ([tmp isKindOfClass:[NSArray class]]) {
                    
                    
                    result = [modelClass mj_objectArrayWithKeyValuesArray:tmp];
                    
                    
                    
                }else if([tmp isKindOfClass:[NSDictionary class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }else if([tmp isKindOfClass:[NSNull class]]){
                    
                    result = nil;
                    
                }
                else if([tmp isKindOfClass:[NSObject class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }
            }else{
                
                result = tmp;
            }
            
            
            success(result);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:@"" code:1
                                             userInfo:responseObject];
            
            failure(error);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        failure(error);
    }];
    
    
    
}



- (void)postImageWithUrlString:(NSString *)urlString
                      parament:(id)paraments
                 postParaments:(LMPostParaments *)postParaments
                       success:(success)success
                       failure:(failure)failure{
    
    //网络检查
    if ([LMHttpTool startNetworkMonitoring] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败,请检查网络" ToView:nil];
        return;
    }
    
    urlString = [NSString stringWithFormat:@"%@%@",self.baseUrl,urlString];
    //断言
    NSAssert(urlString != nil, @"url不能为空");

    
//    AFHTTPSessionManager *sessionManager = [self LMHTTPSessionManager];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];

    
    
    [sessionManager POST:urlString parameters:paraments constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:postParaments.data name:postParaments.name fileName:postParaments.filename mimeType:postParaments.mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
    
}


- (void)synchronizationForRequestType:(NSString *)requestType
                            urlString:(NSString *)urlString
                            parameter:(id)parameter
                           controller:(UIViewController *)viewController
                              success:(success)success
                              failure:(failure)failure{
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.baseUrl,urlString]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:requestType];
    [request setValue:[NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]] forHTTPHeaderField:@"version"];
}



@end
