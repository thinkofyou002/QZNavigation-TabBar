//
//  QZMapMoveAnimationVC.m
//  QZBaseDemo
//
//  Created by QF_iOS on 2018/11/27.
//  Copyright © 2018年 QF_iOS. All rights reserved.
//

#import "QZMapMoveAnimationVC.h"

@interface QZMapMoveAnimationVC ()

@end

@implementation QZMapMoveAnimationVC
//设置透明的导航栏
- (void)viewWillAppear:(BOOL)animated {
    //设置导航栏透明
    [self.navigationController.navigationBar setTranslucent:true];
    //把背景图片设置为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //处理导航啦线条的问题
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    //防止其他页面被渲染成透明的导航栏
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
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
