//
//  UIColor+LM.h
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/12.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LM)

/**
 *  获得随机色
 */
+ (UIColor *)lm_getRandomColor;

/**
 *  根据RGB 获得颜色 alpha = 1
 */
+ (UIColor *)lm_getColorFromRGB:(int)red green:(int)green blue:(int)blue;

/**
 *  根据RGB 获得颜色 alpha自定义
 */
+ (UIColor *)lm_getColorFromRGB:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

/**
 *  根据16进制 获得颜色
 */

+ (UIColor *)lm_getColorFromHex:(NSString *)hex;

/**
 *  通过照片获得颜色
 *
 */
+ (UIColor *)lm_colorWithPatternImageName:(NSString *)imageName;

@end
