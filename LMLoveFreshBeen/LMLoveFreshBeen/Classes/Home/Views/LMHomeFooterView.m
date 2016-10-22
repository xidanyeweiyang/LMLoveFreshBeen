//
//  LMHomeFooterView.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/20.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHomeFooterView.h"


@implementation LMHomeFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
    
    
    UILabel *tittleLabel = [[UILabel alloc] init];
    tittleLabel.text = @"点击查看更多商品 >";
    tittleLabel.textAlignment = NSTextAlignmentCenter;
    tittleLabel.font = [UIFont systemFontOfSize:16];
    tittleLabel.textColor = RGB(150, 150, 150);
    tittleLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    [self addSubview:tittleLabel];
    self.tittleLabel = tittleLabel;
    
}
@end
