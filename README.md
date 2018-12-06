# NumberCalculate

用于购物车或者商品货物添加以更改数量使用

主要参数 
```
/** 初始显示值 不传默认显示0  建议必传*/
@property (nonatomic, copy) NSString *baseNum;

/** 数值增减基数（倍数增减） 默认1的倍数增减 */
@property (nonatomic, assign) NSInteger multipleNum;

/** 最小值 默认且最小为0*/
@property (nonatomic, assign) NSInteger minNum;

/** 最大值  默认99999 */
@property (nonatomic, assign) NSInteger maxNum;
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

![参考](https://github.com/XueYangLee/NumberCalculate/blob/master/screen.gif)
