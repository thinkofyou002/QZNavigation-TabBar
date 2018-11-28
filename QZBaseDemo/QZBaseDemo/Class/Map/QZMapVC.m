//
//  QZMapVC.m
//  QZBaseDemo
//
//  Created by QF_iOS on 2018/11/28.
//  Copyright © 2018年 QF_iOS. All rights reserved.
//

#import "QZMapVC.h"
#import "QZMapMoveAnimationVC.h"
@interface QZMapVC ()

@end

@implementation QZMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mapBtn.backgroundColor = [UIColor orangeColor];
    mapBtn.frame = CGRectMake(100, 200, (kScreenW - 200), 55);
    [mapBtn setTitle:@"轨迹地图" forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(mapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mapBtn];
    // Do any additional setup after loading the view.
}
- (void)mapAction:(UIButton *)sender {
    QZMapMoveAnimationVC *mapVC = [[QZMapMoveAnimationVC alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
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
