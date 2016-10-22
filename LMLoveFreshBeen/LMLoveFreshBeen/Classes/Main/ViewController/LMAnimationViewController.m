//
//  LMAnimationViewController.m
//  LMLoveFreshBeen
//
//  Created by 刘明 on 16/10/21.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMAnimationViewController.h"

@interface LMAnimationViewController ()

@end

@implementation LMAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)animationLayers{
    
    if (!_animationLayers) {
        
        _animationLayers = [NSMutableArray arrayWithCapacity:10];
    }
    return _animationLayers;
}


- (NSMutableArray *)animationBigLayers{
    
    if (!_animationBigLayers) {
        
        _animationBigLayers = [NSMutableArray arrayWithCapacity:10];
    }
    return _animationBigLayers;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
