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

///**
// *  展示进度信息 (带圈圈)
// *
// *  @param message 展示信息
// */
//+ (void)showStatusString:(NSString *)message;
//
///**
// *  展示进度信息 (带时间)
// *
// *  @param message 展示信息
// *  @param duration 展示时间
// */
//+ (void)showStatusString:(NSString *)message duration:(NSTimeInterval)duration;
//
///**
// *  成功信息展示 (默认一秒消失)
// *
// *  @param successMessage 成功信息
// */
//+ (void)showSuccessMessage:(NSString *)successMessage;
//
//
///**
// *  展示信息 (不带圈圈,简单信息展示)
// *
// *  @param message 展示信息
// */
//+ (void)showMessage:(NSString *)message;
//
//
///**
// *  展示警告信息 (有警告图片)
// *
// *  @param message 展示信息
// */
//+ (void)showInfoMessage:(NSString *)message;
//
///**
// *  展示消失
// */
//+ (void)dismiss;
//
///**
// *  展示消失,从指定view
// */
//+ (void)dismissFromView:(UIView *)view;
//
//
///**
// *  失败信息展示 (默认3秒消失)
// *
// *  @param successMessage 失败信息
// */
//+ (void)showFailMessage:(NSString *)failMessage;


#warning lianyanmin
+ (UILabel *)labelWithFontSize:(CGFloat )fontSize textColor:(UIColor *)textColor ;

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor textAligment:(NSTextAlignment)textAligment backgroundColor:(UIColor *)backgroundColor;

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text textAligment:(NSTextAlignment)textAligment backgroundColor:(UIColor *)backgroundColor;
@end
