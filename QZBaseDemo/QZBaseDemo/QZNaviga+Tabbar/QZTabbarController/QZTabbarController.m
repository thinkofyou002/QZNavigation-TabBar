//
//  QZTabbarController.m
//  QZBaseDemo
//
//  Created by QF_iOS on 2018/11/27.
//  Copyright © 2018年 QF_iOS. All rights reserved.
//

#import "QZTabbarController.h"
#import "QZCustomerNavigation.h"
#import "HomeVC.h"
#import "QZMapVC.h"

#import "QZTabBar.h"
@interface QZTabbarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) QZTabBar *qzTabbar;
@property (nonatomic, assign) NSUInteger selectItem;//选中的item

@end

@implementation QZTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _qzTabbar = [[QZTabBar alloc] init];
    
    [_qzTabbar.centerBtn addTarget:self action:@selector(touchCenterBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //选中时的颜色
    _qzTabbar.tintColor = tabbarSelectColor;
    
    //透明设置为NO，显示为白色，view的高度到tabbar顶部截止，YES的话到底部
    _qzTabbar.translucent = NO;
    //利用KVC，将自己的tabbar赋值给系统的tabbar
    [self setValue:_qzTabbar forKey:@"tabBar"];
    
    //默认选中第几个
    self.selectItem = 0;
    self.delegate = self;
    
    
    [self addChildViewControllers];
    
    //分割线的颜色
    [self setTabbarTopLineColor];
    // Do any additional setup after loading the view.
}


- (void)addChildViewControllers {
    //图片大小建议32 * 32
    
    [self addChildVC:[[HomeVC alloc] init] andTitle:@"开心" andImageName:@"眨眼" selectImageName:@"眨眼 (1)"];
    [self addChildVC:[[HomeVC alloc] init] andTitle:@"生气" andImageName:@"生气 (1)" selectImageName:@"生气"];
    [self addChildVC:[[HomeVC alloc] init] andTitle:@"中间" andImageName:@"" selectImageName:@""];//只是占位的效果
    [self addChildVC:[[QZMapVC alloc] init] andTitle:@"地图" andImageName:@"尴尬" selectImageName:@"尴尬 (1)"];
    [self addChildVC:[[HomeVC alloc] init] andTitle:@"卖萌" andImageName:@"卖萌 (1)" selectImageName:@"卖萌"];
}

- (void)addChildVC:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)name selectImageName:(NSString *)selectImageName {
    
    childVC.tabBarItem.image = [UIImage imageNamed:name];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.title = title;
    //调整图片和文字的位置
//    UIEdgeInsets ImageInsets = UIEdgeInsetsMake(3, 0, -3, 0 );
//    
//    childVC.tabBarItem.imageInsets = ImageInsets;
    QZCustomerNavigation *navigation = [[QZCustomerNavigation alloc] initWithRootViewController:childVC];
    [self addChildViewController:navigation];
    
}
//中间按钮的点击
- (void)touchCenterBtnAction:(UIButton *)sender {
    self.selectedIndex = 2;//关联中间按钮
    if (self.selectItem != 2) {
        [self rotationAnimation];
    }
    self.selectItem = 2;
}

//tabbar选择时候代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (tabBarController.selectedIndex == 2) {//选中中间的按钮
        if (self.selectItem != 2) {
            [self rotationAnimation];
            
        }
        
    } else {
        [_qzTabbar.centerBtn.layer removeAllAnimations];
    }
    self.selectItem = tabBarController.selectedIndex;
}

//旋转动画
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration =1;
    rotationAnimation.repeatCount = 1;
    [_qzTabbar.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
}

#pragma mark -- 设置tabbar顶部的线
- (void)setTabbarTopLineColor {
    //该表tabbard线条的颜色
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, RGB(255, 255, 255, 1).CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //两个方法缺一不可，否则将无法改变分割线颜色
    [_qzTabbar setShadowImage:img];
    [_qzTabbar setBackgroundImage:[[UIImage alloc] init]];
    
    
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
