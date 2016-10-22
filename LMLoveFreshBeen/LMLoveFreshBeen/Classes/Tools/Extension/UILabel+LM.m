//
//  UILabel+LM.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/28.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "UILabel+LM.h"

@implementation UILabel (LM)

+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize {
    return [self lm_labelWithTitle:title color:color fontSize:fontSize alignment:NSTextAlignmentCenter];
}

+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    [label sizeToFit];
    
    return label;
}

+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    return [self lm_labelWithTitle:title color:color font:font alignment:NSTextAlignmentCenter];
}

+ (instancetype)lm_labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = color;
    label.font = font;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    [label sizeToFit];
    return label;
}

@end
