# NumberCalculate

用于购物车或者商品货物添加以更改数量使用

参数信息 
```
/** 显示数值/初始值 默认0 */
@property (nonatomic, assign) NSInteger showNum;

/** 数值增减基数（倍数增减） 默认1的倍数增减 */
@property (nonatomic, assign) NSInteger multipleNum;

/** 最小值 默认且最小为0*/
@property (nonatomic, assign) NSInteger minNum;

/** 最大值  默认99999 */
@property (nonatomic, assign) NSInteger maxNum;

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
```

回调方式block跟delegate两种方式可选
```
/** 结果回传 */
@property (nonatomic, copy) void (^resultNumber)(NSInteger number);

@property (nonatomic, weak) id<NumberCalculateDelegate>delegate;
- (void)resultNumber:(NSInteger)number;
```

```
_number.resultNumber = ^(NSInteger number) {
    NSLog(@"%ld>>>resultBlock>>",number);
};


- (void)resultNumber:(NSInteger)number{
    NSLog(@"%ld>>>resultDelegate>>",number);
}
```

![参考](https://github.com/XueYangLee/NumberCalculate/blob/master/screen.gif)
