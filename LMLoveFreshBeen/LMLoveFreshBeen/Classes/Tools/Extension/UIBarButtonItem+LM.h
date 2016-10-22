//
//  UIBarButtonItem+LM.h
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/22.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LM)

/**
 *  自已定义图片的BarButtonItem
 */
+ (UIBarButtonItem *)lm_buttonItemWithImageName:(NSString *)imageName selector:(SEL) selector andTarget:(id) target;


/**
 *  通过文字创建BarButtonItem
 */

+ (UIBarButtonItem *)lm_buttonItemWithString:(NSString *)string selector:(SEL) selector andTarget:(id) target;

/**
 *  通过系统样式创建BarButtonItem
 */

+ (UIBarButtonItem *)lm_buttonItemWithSystemItem:(UIBarButtonSystemItem)itemStyle selector:(SEL) selector andTarget:(id) target;
@end
