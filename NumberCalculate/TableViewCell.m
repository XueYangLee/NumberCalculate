//
//  TableViewCell.m
//  NumberCalculate
//
//  Created by 李雪阳 on 2018/5/31.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _numberCalculate.delegate=self;
}

- (void)resultNumber:(NSString *)number{
    NSLog(@"%@>>>resultDelegate>>",number);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
