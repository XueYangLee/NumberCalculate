//
//  NumberCalculate.h
//  NumberCalculate
//
//  Created by 李雪阳 on 2018/5/29.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumberCalculateDelegate <NSObject>

- (void)resultNumber:(NSInteger)number;

@end

@interface NumberCalculate : UIView

/** 结果回传 */
@property (nonatomic, copy) void (^resultNumber)(NSInteger number);
@property (nonatomic, weak) id<NumberCalculateDelegate>delegate;


/** 显示数值/初始值 默认0 */
@property (nonatomic, assign) NSInteger showNum;

/** 数值增减基数（倍数增减） 默认1的倍数增减 */
@property (nonatomic, assign) NSInteger multipleNum;

/** 最小值 默认且最小为0*/
@property (nonatomic, assign) NSInteger minNum;

/** 最大值  默认99999 */
@property (nonatomic, assign) NSInteger maxNum;

/** 重置显示数值并回传结果 */
@property (nonatomic, assign) NSInteger resetShowNum;//场景：商品sku切换时  A商品最高sku高于B商品 选择A商品并将数量设置为A商品的最高sku 切换到B商品时需重置当前所选数量至B商品的最高sku并回传结果

/** 返回当前显示的数值 */
- (NSInteger)currentNumber;



/** 数字框是否可以手动输入  默认可以 */
@property (nonatomic, assign) BOOL canText;

/** 是否开启晃动  默认开启 */
@property (nonatomic, assign) BOOL isShake;



/** 是否隐藏边框线  默认显示 */
@property (nonatomic, assign) BOOL hidBorder;

/** 视图圆角弧度   */
@property (nonatomic, assign) CGFloat numCornerRadius;

/** 边框线颜色 */
@property (nonatomic, strong) UIColor *numBorderColor;

/** 加减按钮颜色 */
@property (nonatomic, strong) UIColor *buttonColor;

/** 数值文字颜色 */
@property (nonatomic, strong) UIColor *numTextColor;

/** 数值文字字体 */
@property (nonatomic, strong) UIFont *numTextFont;


@end
