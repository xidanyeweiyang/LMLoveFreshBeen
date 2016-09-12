//
//  UIView+LMUIViewExtension.m
//  封装提示框
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "UIView+LMUIViewExtension.h"
#import "MBProgressHUD+LM.h"

@implementation UIView (LMUIViewExtension)

@dynamic x;
@dynamic y;
@dynamic width;
@dynamic height;
@dynamic origin;
@dynamic size;

#pragma mark ---------------- Setters-----------------
-(void)setX:(CGFloat)x{
    CGRect r        = self.frame;
    r.origin.x      = x;
    self.frame      = r;
}

-(void)setY:(CGFloat)y{
    CGRect r        = self.frame;
    r.origin.y      = y;
    self.frame      = r;
}

-(void)setWidth:(CGFloat)width{
    CGRect r        = self.frame;
    r.size.width    = width;
    self.frame      = r;
}

-(void)setHeight:(CGFloat)height{
    CGRect r        = self.frame;
    r.size.height   = height;
    self.frame      = r;
}

-(void)setOrigin:(CGPoint)origin{
    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark ---------------- Getters-----------------
-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGPoint)origin{
    return CGPointMake(self.x, self.y);
}

-(CGSize)size{
    return CGSizeMake(self.width, self.height);
}

-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(CGFloat)centerY {
    return self.center.y;
}

-(UIView *)lastSubviewOnX{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

-(UIView *)lastSubviewOnY{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}

///**
// *  展示进度信息 (带圈圈)
// *
// *  @param message 展示信息
// */
//+ (void)showStatusString:(NSString *)message{
//    
//    [SVProgressHUD showWithStatus:message];
//    
//}
//
///**
// *  展示进度信息 (带时间)
// *
// *  @param message 展示信息
// *  @param duration 展示时间
// */
//+ (void)showStatusString:(NSString *)message duration:(NSTimeInterval)duration{
//    
//    
//    [UIView showStatusString:message];
//    
//    [SVProgressHUD dismissWithDelay:duration];
//    
//}
//
///**
// *  展示信息 (不带图片,简单信息展示)
// *
// *  @param message 展示信息
// */
//+ (void)showMessage:(NSString *)message{
//    
////    [SVProgressHUD setInfoImage:nil];
////    
////    [SVProgressHUD showInfoWithStatus:message];
//    
//    
//}
//
///**
// *  展示消失
// */
//+ (void)dismiss{
//    
////    [SVProgressHUD dismiss];
//    
//    [MBProgressHUD hideHUD];
//}
//
///**
// *  展示消失,从指定view
// */
//+ (void)dismissFromView:(UIView *)view{
//    
//    [MBProgressHUD hideHUDForView:view];
//}
//
//
///**
// *  展示警告信息 (有警告图片)
// *
// *  @param message 展示信息
// */
//+ (void)showInfoMessage:(NSString *)message{
//    
//    [SVProgressHUD showInfoWithStatus:message];
//}
//
///**
// *  成功信息展示
// *
// *  @param successMessage 成功信息
// */
//+ (void)showSuccessMessage:(NSString *)successMessage{
//    
////    [SVProgressHUD setMinimumDismissTimeInterval:kSuccessDurtion];
////    
////    [SVProgressHUD showSuccessWithStatus:successMessage];
//    
//    [MBProgressHUD showSuccess:successMessage ToView:nil];
//    
//}
//
///**
// *  失败信息展示 (默认3秒消失)
// *
// *  @param successMessage 失败信息
// */
//+ (void)showFailMessage:(NSString *)failMessage{
//    
////    [SVProgressHUD setMinimumDismissTimeInterval:kFailDurtion];
////    
////    [SVProgressHUD showErrorWithStatus:failMessage];
//
//    [MBProgressHUD showError:failMessage ToView:nil];
//}



#warning lianyanmin

- (void)cornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.drawsAsynchronously = YES;
}
- (void)borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.masksToBounds = YES;
    self.layer.drawsAsynchronously = YES;
}

- (void)cornerRadius:(CGFloat)radius rectCorner:(UIRectCorner)rectCorner borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    UIBezierPath*path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius,radius)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
    self.layer.masksToBounds = YES;
    self.layer.drawsAsynchronously =  YES;
    if (borderWidth) {
        self.layer.borderWidth = borderWidth;
    }
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
}

+ (UILabel *)labelWithFontSize:(CGFloat )fontSize textColor:(UIColor *)textColor {
    return [self labelWithFont:[UIFont systemFontOfSize:fontSize] textColor:textColor text:nil textAligment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
}

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor textAligment:(NSTextAlignment)textAligment backgroundColor:(UIColor *)backgroundColor {
    return [self labelWithFont:font textColor:textColor text:nil textAligment:textAligment backgroundColor:backgroundColor];
}

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text textAligment:(NSTextAlignment)textAligment backgroundColor:(UIColor *)backgroundColor {
    UILabel *label = [[UILabel alloc]init];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    label.textAlignment = textAligment;
    label.backgroundColor = backgroundColor;
    return label;
}
@end
