//
//  UIBarButtonItem+LM.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/9/22.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "UIBarButtonItem+LM.h"

@implementation UIBarButtonItem (LM)


/**
 *  自已定义图片的BarButtonItem
 */
+ (UIBarButtonItem *)lm_buttonItemWithImageName:(NSString *)imageName selector:(SEL) selector andTarget:(id) target;{
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [searchButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    searchButton.frame = CGRectMake(0, 0, 19, 16);
    
    return [[UIBarButtonItem alloc] initWithCustomView:searchButton];
}


/**
 *  通过文字创建BarButtonItem
 */

+ (UIBarButtonItem *)lm_buttonItemWithString:(NSString *)string selector:(SEL) selector andTarget:(id) target;{
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:string forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0, 0, 60, 18);
    
    return [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}
/**
 *  通过系统样式创建BarButtonItem
 */

+ (UIBarButtonItem *)lm_buttonItemWithSystemItem:(UIBarButtonSystemItem)itemStyle selector:(SEL) selector andTarget:(id) target;{
    
    UIBarButtonItem * btnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:itemStyle target:target action:selector];
//    btnItem.tintColor = [UIColor whiteColor];
    
    return btnItem;

}


@end
