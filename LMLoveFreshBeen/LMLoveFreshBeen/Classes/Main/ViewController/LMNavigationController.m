//
//  LMNavigationController.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/8/2.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMNavigationController.h"

@interface LMNavigationController ()<UINavigationControllerDelegate>

@end

@implementation LMNavigationController

+ (void)initialize{
    
    [super initialize];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = LMNavBarColor;
    bar.tintColor = LMWhiteColor;
    bar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:LMWhiteColor};
    
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;

    self.popDelegate = self.interactivePopGestureRecognizer.delegate;

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {

        //方式一:
        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setTitle:@"返回" forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        btn.size = CGSizeMake(70, 30);
//        //左对齐
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        //按钮的内容往左边偏移10
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [btn addTarget:self action:@selector(navigationBackClick) forControlEvents:UIControlEventTouchUpInside];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//
        
        //方式二:
//        
//        viewController.hidesBottomBarWhenPushed = YES;
//        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        negativeSpacer.width = -5;
//        
//        //设置导航栏的按钮
//        UIBarButtonItem *backButton = [UIBarButtonItem itemWithImageName:@"navigationbar_back_image" highImageName:@"navigationbar_back_image" target:self action:@selector(back)];
//        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
//        
//        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
        
        viewController.hidesBottomBarWhenPushed = YES;
        

    }
    
    [super pushViewController:viewController animated:YES];
}

//// 完全展示完调用
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    // 如果展示的控制器是根控制器，就还原pop手势代理
//    if (viewController == [self.viewControllers firstObject]) {
//        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
//    }
//}
//


@end
