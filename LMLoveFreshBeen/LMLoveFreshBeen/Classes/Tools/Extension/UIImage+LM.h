//
//  UIImage+LM.h
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/25.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LM)

- (UIImage *)lm_applyLightEffect;
//亮色蒙版
- (UIImage *)lm_applyExtraLightEffect;
//灰色蒙版
- (UIImage *)lm_applyDarkEffect;
//添加自定义颜色蒙版
- (UIImage *)lm_applyTintEffectWithColor:(UIColor *)tintColor;

//加蒙版
- (UIImage *)lm_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

//从颜色那照片
- (UIImage *)lm_imageFromColor:(UIColor *)color size:(CGSize)size alpha:(CGFloat)alpha;

//截屏
- (UIImage *)lm_createImageFromView:(UIView *)view;

//做一个圆图
- (UIImage *)lm_imageClipOvalImage;

@end
