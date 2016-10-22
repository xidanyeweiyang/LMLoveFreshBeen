//
//  LMPageScrollView.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/17.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMPageScrollView.h"

@interface LMPageScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation LMPageScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    self.scrollView = scrollView;
    
    [scrollView setContentSize:CGSizeMake(self.scrollView_width * self.imageArray.count, 0)];
    
    [self addSubview:scrollView];
    
    
    for (int i = 0; i< self.imageArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView_width * i, 0, self.scrollView_width, self.scrollView_height)];
        
        imageView.image = [UIImage imageNamed:self.imageArray[i]];
        
        [self.scrollView addSubview:imageView];
    }
    
    float pageControlW = 18 * self.imageArray.count;
    float pageControlH = 20;
    float pageControlX = self.scrollView_width - pageControlW;
    float pageControlY = self.scrollView_height - pageControlH;


    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(pageControlX, pageControlY, pageControlW, pageControlH)];
    
    
    if (!self.pageIndicatorTintColor) {
        self.pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    
    if (!self.currentPageIndicatorTintColor) {
        self.currentPageIndicatorTintColor = [UIColor redColor];
    }
    pageControl.hidesForSinglePage = YES;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = self.pageIndicatorTintColor;
    pageControl.currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
    self.pageControl = pageControl;
    [self addSubview:pageControl];
    
    
}



@end
