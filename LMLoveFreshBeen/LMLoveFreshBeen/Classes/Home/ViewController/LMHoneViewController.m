//
//  LMHoneViewController.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/17.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHoneViewController.h"
#import "LMHomeHeaderView.h"
#import "LMHomeFooterView.h"
#import "LMLMHomeProductCollectionViewCell.h"
#import "LMHomeCollectionHeaderView.h"
#define HomecellMargin 10

@interface LMHoneViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *contentCollectionView;

@property (nonatomic, assign) BOOL isAnimation;

@property (nonatomic, assign) CGFloat lastContentOffsetY;

@end

@implementation LMHoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    
}


- (void)setupUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;    
    flowLayout.sectionInset = UIEdgeInsetsMake(0, HomecellMargin, 0, HomecellMargin);
//    flowLayout.headerReferenceSize = CGSizeMake(0, 10);
    
    UICollectionView *contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, BETWEEN_HEIGHT) collectionViewLayout:flowLayout];
    
    contentCollectionView.delegate = self;
    contentCollectionView.dataSource = self;
    contentCollectionView.backgroundColor = LMBackgroudColor;
    
    //表头
    LMHomeCollectionHeaderView *collectionHeaderView = [[LMHomeCollectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.31)];
    [contentCollectionView addSubview:collectionHeaderView];
    
    //组头
    [contentCollectionView registerClass:[LMLMHomeProductCollectionViewCell class] forCellWithReuseIdentifier:@"LMLMHomeProductCollectionViewCell"];
    
    [contentCollectionView registerClass:[LMHomeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LMHomeHeaderView"];
    
    //组尾
    [contentCollectionView registerClass:[LMHomeFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"LMHomeFooterView"];
    
    
    self.contentCollectionView = contentCollectionView;
    [self.view addSubview:contentCollectionView];
    

}

#pragma mark -collectionView代理

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LMLMHomeProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LMLMHomeProductCollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor lm_getRandomColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 1)) {
        
        return;
    }
    
    if (self.isAnimation) {
        
        [self startSpringAnimationWithView:cell duration:1 offsetY:80];
    }
}


- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
    if (self.isAnimation && indexPath.section == 0) {
        
        [self startSpringAnimationWithView:view duration:1 offsetY:60];
    }
 
    
}

//头和尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 && kind == UICollectionElementKindSectionHeader) {
        
        LMHomeHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LMHomeHeaderView" forIndexPath:indexPath];
        
        return headerView;
        
    }else{
        
        LMHomeFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"LMHomeFooterView" forIndexPath:indexPath];
        
        
        if (indexPath.section == 0) {
            
            footerView.tittleLabel.hidden = YES;
            footerView.tag = 10010;
            
        }else{
            
            footerView.tittleLabel.hidden = NO;
            footerView.tag = 10086;
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickMoreProductions:)];
        
        [footerView addGestureRecognizer:tap];
        
        return footerView;
 
    }
}


- (void)didClickMoreProductions:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag == 10086) {
        
        NSLog(@"%s",__FUNCTION__);
    }
}

//组头尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH, HomecellMargin);
        
    }else if(section == 1){
        
        return CGSizeMake(SCREEN_WIDTH, HomecellMargin * 2);
        
    }else{
        
        return CGSizeZero;
    }

}

//itemSize
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH - 2 * HomecellMargin, 140);
    }else if (indexPath.section == 1){
        
        return CGSizeMake((SCREEN_WIDTH - 2 * HomecellMargin)*0.5 -5, 250);
    }else{
        
        return CGSizeZero;

    }
}


//组尾尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH, HomecellMargin);
        
    }else if(section == 1){
        
        return CGSizeMake(SCREEN_WIDTH, HomecellMargin * 5);

    }else{
        
        return CGSizeZero;
    }
}


#pragma mark - cell出现的动画效果

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.animationLayers.count > 0) {
        
        CALayer *animationLayers = self.animationLayers[0];
        animationLayers.hidden = YES;
    }
    
    if (scrollView.contentOffset.y <= scrollView.contentSize.height) {
        
        //上滑才有动画
        self.isAnimation = self.lastContentOffsetY < scrollView.contentOffset.y;
        
        self.lastContentOffsetY = scrollView.contentOffset.y;
    }
}

- (void)startSpringAnimationWithView:(UIView *)view duration:(NSTimeInterval)time offsetY:(CGFloat)offsetY{
    
    view.transform = CGAffineTransformMakeTranslation(0, offsetY);
    
    [UIView animateWithDuration:time animations:^{
        
        view.transform = CGAffineTransformIdentity;;

    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
