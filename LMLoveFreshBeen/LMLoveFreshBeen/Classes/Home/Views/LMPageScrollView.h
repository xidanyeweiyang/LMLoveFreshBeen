//
//  LMPageScrollView.h
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/17.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMPageScrollView : UIView

@property (nonatomic, assign) float scrollView_width;

@property (nonatomic, assign) float scrollView_height;

@property (nonatomic, assign) NSInteger scrollView_pageCount;

@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;
@end
