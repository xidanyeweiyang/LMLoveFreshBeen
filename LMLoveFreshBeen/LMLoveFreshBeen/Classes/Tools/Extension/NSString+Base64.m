//
//  NSString+Base64.m
//  Cofco
//
//  Created by 刘明 on 16/7/25.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

- (NSString *)lm_base64encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)lm_base64decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)lm_basicAuthString {
    return [@"BASIC " stringByAppendingString:self.lm_base64encode];
}


@end
