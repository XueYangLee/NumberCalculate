//
//  NumberCalculate.h
//  NumberCalculate
//
//  Created by 李雪阳 on 2018/5/29.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumberCalculateDelegate <NSObject>

- (void)resultNumber:(NSString *)number;

@end

@interface NumberCalculate : UIView

/** 结果回传 */
@property (nonatomic, copy) void (^resultNumber)(NSString *number);
@property (nonatomic, weak) id<NumberCalculateDelegate>delegate;

/** 初始显示值 不传默认显示0  建议必传*/
@property (nonatomic, copy) NSString *baseNum;

/** 数值增减基数（倍数增减） 默认1的倍数增减 */
@property (nonatomic, assign) NSInteger multipleNum;

/** 最小值 默认且最小为0*/
@property (nonatomic, assign) NSInteger minNum;

/** 最大值  默认99999 */
@property (nonatomic, assign) NSInteger maxNum;



/** 是否隐藏边框线  默认显示 */
@property (nonatomic, assign) BOOL hidBorder;

/** 边框线颜色 */
@property (nonatomic, strong) UIColor *numborderColor;

/** 加减按钮颜色 */
@property (nonatomic, strong) UIColor *buttonColor;

/** 是否开启晃动  默认开启 */
@property (nonatomic, assign) BOOL isShake;


@end
