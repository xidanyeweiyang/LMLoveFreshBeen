//
//  UILabel+LM.h
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/28.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LM)

/**
 * 创建 UILabel
 *
 *  @param title    标题
 *  @param color    标题颜色
 *  @param fontSize 字体大小
 *
 *  @return UILabel(文本水平居中)
 */
+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize;


/**
 * 创建 UILabel
 *
 *  @param title    标题
 *  @param color    标题颜色
 *  @param font     字体
 *
 *  @return UILabel(文本水平居中)
 */
+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;


/**
 *  创建 UILabel
 *
 *  @param title     标题
 *  @param color     标题颜色
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *
 *  @return UILabel
 */
+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;


/**
 *  创建 UILabel
 *
 *  @param title     标题
 *  @param color     标题颜色
 *  @param font      字体
 *  @param alignment 对齐方式
 *
 *  @return UILabel
 */
+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)alignment;

@end
