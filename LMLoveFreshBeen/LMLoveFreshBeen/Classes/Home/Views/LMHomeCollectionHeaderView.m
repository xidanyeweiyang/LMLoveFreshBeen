//
//  LMHomeCollectionHeaderView.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/21.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHomeCollectionHeaderView.h"

@implementation LMHomeCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
        
    
    LMPageScrollView *pageScrollView = [[LMPageScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width * 0.31)];
    
    pageScrollView.imageArray = @[@"v2_test_entry_icon",@"v2_pickup_empty",@"v2_my_avatar_bg",@"v2_test_entry_icon",@"v2_pickup_empty",@"v2_my_avatar_bg"];
    
    pageScrollView.scrollView_width = self.bounds.size.width;
    pageScrollView.scrollView_height = self.bounds.size.width * 0.31;
    pageScrollView.pageIndicatorTintColor = [UIColor lm_colorWithPatternImageName:@"v2_home_cycle_dot_normal"];
    pageScrollView.currentPageIndicatorTintColor = [UIColor lm_colorWithPatternImageName:@"v2_home_cycle_dot_selected"];
    
    
    [self addSubview:pageScrollView];
    
    
}


@end
