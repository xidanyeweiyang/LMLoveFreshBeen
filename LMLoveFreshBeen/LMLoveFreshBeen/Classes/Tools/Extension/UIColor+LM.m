//
//  UIColor+LM.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/12.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "UIColor+LM.h"

@implementation UIColor (LM)

/**
 *  获得随机色
 */
+ (UIColor *)lm_getRandomColor{
    
    float red = arc4random_uniform(255);
    float blue = arc4random_uniform(255);
    float green = arc4random_uniform(255);
    
    return [UIColor lm_getColorFromRGB:red green:green blue:blue];
}

/**
 *  根据RGB获得颜色 alpha = 1
 */
+ (UIColor *)lm_getColorFromRGB:(int)red green:(int)green blue:(int)blue{
    
    return [UIColor lm_getColorFromRGB:red green:green blue:blue alpha:1];
}

/**
 *  根据RGB 获得颜色 alpha自定义
 */
+ (UIColor *)lm_getColorFromRGB:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha{
    
    UIColor *color = [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha];
    
    return color;
    
}

/**
 *  根据16进制 获得颜色
 */

+ (UIColor *)lm_getColorFromHex:(NSString *)hex{
    
    if (!hex || [hex isEqualToString:@""]) {
        
        return nil;
    }
    
    unsigned red,green,blue;
    NSRange range;
    range.length   = 2;
    range.location = 1;
    
    [[NSScanner scannerWithString:[hex substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hex substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hex substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor lm_getColorFromRGB:red green:green blue:blue];
}


/**
 *  通过照片获得颜色
 *
 */
+ (UIColor *)lm_colorWithPatternImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        return [UIColor colorWithPatternImage:image];
    }
    return nil;
}


@end

