//
//  LMHomeProductTableViewCell.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/20.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHomeProductTableViewCell.h"

@implementation LMHomeProductTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tabelView indexPath:(NSIndexPath *)indexPath reuserID:(NSString *)reuserID{
    
    LMHomeProductTableViewCell *cell = [tabelView dequeueReusableCellWithIdentifier:reuserID forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[LMHomeProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
    }
    
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self setupUI];
    }
    
    return self;
}


- (void)setupUI{
    
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
