//
//  QZCustomerNavigation.m
//  QZBaseDemo
//
//  Created by QF_iOS on 2018/11/27.
//  Copyright © 2018年 QF_iOS. All rights reserved.
//

#import "QZCustomerNavigation.h"

@interface QZCustomerNavigation ()

@end

@implementation QZCustomerNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    //可设置一些样式
    //设置NO之后view自动s下沉navigationBar的高度
    self.navigationBar.translucent = NO;
    //改变Item的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    //改变ztitle的字体样式
//    NSDictionary *textAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName: FONT_SYSTEM_BOLD(18)};
//    [self.navigationBar setTitleTextAttributes:textAttributes];
    //改变navBar的背景颜色
    [self.navigationBar setBarTintColor:kLightKinCOlor];
    // Do any additional setup after loading the view.
}

//重写这个方法，在跳转之后自动隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([self.viewControllers count] > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //可以在这里自定义设置返回按钮
        
//         UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_returni"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//         viewController.navigationItem.leftBarButtonItem = backItem;
        
    }
    //u一定要z写在最后,不然无效
    [super pushViewController:viewController animated:animated];
    //处理了push之h后隐藏底部UITabBar的情况，并解决了iphonex上push时，UITabBar上移的问题
    CGRect rect = self.tabBarController.tabBar.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    self.tabBarController.tabBar.frame = rect;
    
    
    
    
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
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
