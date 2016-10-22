//
//  UIView+LMUIViewExtension.h
//  封装提示框
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVProgressHUD.h>

#define kSuccessDurtion 1
#define kFailDurtion 3

@interface UIView (LMUIViewExtension)
@property (nonatomic, assign) CGFloat   x;
@property (nonatomic, assign) CGFloat   y;
@property (nonatomic, assign) CGFloat   width;
@property (nonatomic, assign) CGFloat   height;
@property (nonatomic, assign) CGPoint   origin;
@property (nonatomic, assign) CGSize    size;
@property (nonatomic, assign) CGFloat   bottom;
@property (nonatomic, assign) CGFloat   right;
@property (nonatomic, assign) CGFloat   centerX;
@property (nonatomic, assign) CGFloat   centerY;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

/**
 *  移除此view上的所有子视图
 */
- (void)removeAllSubviews;

/**
 *  设圆角
 *
 *  @param radius 圆角半径
 */
- (void)lm_cornerRadius:(CGFloat)radius;


/**
 *  设边框
 *
 *  @param borderWidth 边框宽
 *  @param borderColor 变宽颜色
 */
- (void)lm_borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  设自定义圆角
 *
 *  @param radius      圆角半径
 *  @param rectCorner  圆角方向
 *  @param borderWidth 圆角宽度
 *  @param borderColor 圆角颜色
 */
- (void)lm_cornerRadius:(CGFloat)radius rectCorner:(UIRectCorner)rectCorner borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
