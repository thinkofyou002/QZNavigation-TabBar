//
//  QZTabBar.m
//  QZBaseDemo
//
//  Created by QF_iOS on 2018/11/27.
//  Copyright © 2018年 QF_iOS. All rights reserved.
//

#import "QZTabBar.h"

@implementation QZTabBar

- (instancetype)init {
    if (self == [super init]) {
        [self initView];
    
    }
    return self;
}

- (void)initView {
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置button大小为适应图片
    UIImage *normalImage = [UIImage imageNamed:@"tabbar_add"];
    _centerBtn.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [_centerBtn setImage:normalImage forState:UIControlStateNormal];
    //去除选择高亮
    _centerBtn.adjustsImageWhenHighlighted = NO;
    //根据图片调整BUTTON的位置（图片中心在tabbar的中间最上部，这个时候由于按钮是有一份超出tabbar的，所以点击无效，要进行处理）
    _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImage.size.width)/2.0, - normalImage.size.height/2.0, normalImage.size.width, normalImage.size.height);
    [self addSubview:_centerBtn];
    
    
}



//处理超过点击区域无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden) {
        return [super hitTest:point withEvent:event];
    } else {
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域范围内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)) {
            //返回按钮
            return self.centerBtn;
        } else {
            return [super hitTest:point withEvent:event];
        }
    }
}
@end
