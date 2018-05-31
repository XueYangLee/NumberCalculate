# NumberCalculate

用于购物车或者商品货物添加以更改数量使用

主要参数 
```
/** 初始显示值 不传默认显示0 */
@property (nonatomic, copy) NSString *baseNum;

/** 数值增减基数（倍数增减） 默认1的倍数增减 */
@property (nonatomic, copy) NSString *multipleNum;

/** 最小值是否为0  默认YES  为NO时最小值以multipleNum的设定为准 */
@property (nonatomic, assign) BOOL minFormZero;
```
当以上参数均不传的时候则为普通计数方式 从0开始以1的倍数加减

回调方式block跟delegate两种方式可选
```
/** 结果回传 */
@property (nonatomic, copy) void (^resultNumber)(NSString *number);
@property (nonatomic, weak) id<NumberCalculateDelegate>delegate;
```

```
number.resultNumber = ^(NSString *number) {
NSLog(@"%@>>>resultBlock>>",number);
};


- (void)resultNumber:(NSString *)number{
NSLog(@"%@>>>resultDelegate>>",number);
}
```

参考目录下screen.gif

