//
//  ViewController.m
//  NumberCalculate
//
//  Created by 李雪阳 on 2018/5/29.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "ViewController.h"
#import "NumberCalculate.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *remind=[[UILabel alloc]initWithFrame:CGRectMake(50, 70, 150, 20)];
    remind.textColor=[UIColor blackColor];
    remind.text=@"倍数加减（2倍）";
    [self.view addSubview:remind];
    
    NumberCalculate *number=[[NumberCalculate alloc]initWithFrame:CGRectMake(50, 100, 150, 50)];
    number.baseNum=@"2";
    number.multipleNum=2;//数值增减基数（倍数增减） 默认1的倍数增减
    number.minNum=2;
    number.maxNum=10;//最大值
    [self.view addSubview:number];
    number.resultNumber = ^(NSString *number) {
        NSLog(@"%@>>>resultBlock>>",number);
    };
    
    /**************************************************************/
    UILabel *xib=[[UILabel alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2-30, 200, 20)];
    xib.textColor=[UIColor blackColor];
    xib.text=@"xib搭建的cell上使用";
    [self.view addSubview:xib];
    
    
    UITableView *table=[[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2, SCREEN_WIDTH, SCREEN_HEIGHT/2) style:UITableViewStylePlain];
    table.rowHeight=100;
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cid"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
