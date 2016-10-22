//
//  LMHomeHeaderView.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/20.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHomeHeaderView.h"

@implementation LMHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
    
    
    UILabel *tittleLabel = [[UILabel alloc] init];
    tittleLabel.text = @"新鲜热卖";
    tittleLabel.textAlignment = NSTextAlignmentLeft;
    tittleLabel.font = [UIFont systemFontOfSize:14];
    tittleLabel.textColor = RGB(150, 150, 150);
    tittleLabel.frame = CGRectMake(10, 0, 200, 20);
    [self addSubview:tittleLabel];
    self.tittleLabel = tittleLabel;
    
}


@end
