//
//  QZColorHeader.h
//  QZBaseDemo
//
//  Created by QF_iOS on 2018/11/27.
//  Copyright © 2018年 QF_iOS. All rights reserved.
//

#ifndef QZColorHeader_h
#define QZColorHeader_h
//**********************    app主题色    **********************
#define qzNavigaTionColor  [UIColor whiteColor]
//选中
#define tabbarSelectColor  QZColor16Hex(0X13227a)
//未选中
#define tabbarNoSelectColor   QZColor16Hex(0X999590)
//价格的颜色
#define priceOrangeColor   QZColor16Hex(0Xfea613)

//线的颜色
#define kBackgroundColorQZ  RGB(232,233,235,1) //背景色

//**********************    常用配色方法     **********************

// 16进制颜色(透明度1)
#define QZColor16Hex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//带透明度的16进制
#define QZColor16HexWithAlpha(rgbValue,alph) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alph]

//随机色
#define QZRandomColor [UIColor colorWithRed:0.1+0.1*(arc4random()%10) green:0.1+0.1*(arc4random()%10) blue:0.1+0.1*(arc4random()%10) alpha:0.1+0.1*(arc4random()%10)]

//RGB颜色
//颜色定义
#define RGBAlpha(r, g, b, a)   [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
//颜色定义
#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


//**********************    组件颜色     **********************
#define qzTableViewBackgroundColor QZColor16Hex(0x18d06b)  //tableview的背景色
#define kMainTipTextQZ  RGB(127,127,127,1) // 提示文字
#define YKCOLOR_MAIN    [UIColor whiteColor]//程序主色


#define grayLineColor QZColor16Hex(0xebeae8) //灰线的颜色

#endif /* QZColorHeader_h */
