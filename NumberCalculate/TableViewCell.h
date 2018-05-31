//
//  TableViewCell.h
//  NumberCalculate
//
//  Created by 李雪阳 on 2018/5/31.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberCalculate.h"

@interface TableViewCell : UITableViewCell<NumberCalculateDelegate>

@property (weak, nonatomic) IBOutlet NumberCalculate *numberCalculate;

@end
