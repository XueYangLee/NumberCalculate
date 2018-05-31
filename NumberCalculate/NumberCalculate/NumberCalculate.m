//
//  NumberCalculate.m
//  NumberCalculate
//
//  Created by 李雪阳 on 2018/5/29.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "NumberCalculate.h"

@interface NumberCalculate()<UITextFieldDelegate>
/** 加 */
@property (nonatomic, strong) UIButton *addBtn;
/** 减 */
@property (nonatomic, strong) UIButton *reduceBtn;
/** 数值框 */
@property (nonatomic, strong) UITextField *numberText;
/** 记录数值 */
@property (nonatomic, copy) NSString *recordNum;

@end

#define numborderWidth 1
#define defaultMax 99999

@implementation NumberCalculate

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self){
        [self setView];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]){
        [self setView];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setView];
}

- (void)setView{
    [_reduceBtn removeFromSuperview];
    [_numberText removeFromSuperview];
    [_addBtn removeFromSuperview];
    
    _isShake=YES;
    _minFormZero=YES;
    _multipleNum=@"1";
    _maxNum=defaultMax;
    
    CGFloat viewWidth=self.frame.size.width;
    CGFloat btnWidth=self.frame.size.height;
    _reduceBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, btnWidth, btnWidth)];
    [_reduceBtn setImage:[UIImage imageNamed:@"btn_num_minus"] forState:UIControlStateNormal];
    [_reduceBtn addTarget:self action:@selector(reduceNumberClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_reduceBtn];
    
    _numberText=[[UITextField alloc]initWithFrame:CGRectMake(btnWidth-1, 0, viewWidth-btnWidth*2, btnWidth)];
    if (_baseNum.length!=0) {
        _numberText.text=_baseNum;
    }else{
        _numberText.text=@"0";
    }
    _numberText.textColor=[UIColor darkGrayColor];
    _numberText.keyboardType = UIKeyboardTypeNumberPad;
    _numberText.textAlignment = NSTextAlignmentCenter;
    _numberText.delegate=self;
    [_numberText addTarget:self action:@selector(textNumberChange:) forControlEvents:UIControlEventEditingChanged];//
    [self addSubview:_numberText];
    
    _addBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_numberText.frame)-1, 0, btnWidth, btnWidth)];
    [_addBtn setImage:[UIImage imageNamed:@"btn_num_add"] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addNumberClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    
    if (!_hidBorder) {
        _reduceBtn.layer.borderWidth=numborderWidth;
        _numberText.layer.borderWidth=numborderWidth;
        _addBtn.layer.borderWidth=numborderWidth;
        
        if (_numborderColor) {
            _reduceBtn.layer.borderColor=_numborderColor.CGColor;
            _numberText.layer.borderColor=_numborderColor.CGColor;
            _addBtn.layer.borderColor=_numborderColor.CGColor;
        }else{
            _reduceBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
            _numberText.layer.borderColor=[UIColor lightGrayColor].CGColor;
            _addBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        }
    }
}

/** 减 */
- (void)reduceNumberClick{
    [_numberText resignFirstResponder];
    
    if ([_numberText.text integerValue]<= (_minFormZero?0:[_multipleNum integerValue])){
        [self shakeAnimation];
        return;
    }
    
    _numberText.text=[NSString stringWithFormat:@"%ld",(long)[_numberText.text integerValue]-[_multipleNum integerValue]];
    
    [self callBackResultNumber:_numberText.text];
}

/** 加 */
- (void)addNumberClick{
    [_numberText resignFirstResponder];
    
    if (_numberText.text.integerValue < _maxNum) {
        _numberText.text=[NSString stringWithFormat:@"%ld",(long)[_numberText.text integerValue]+[_multipleNum integerValue]];
    }else{
        [self shakeAnimation];
    }
    
    [self callBackResultNumber:_numberText.text];
}

/** 数值变化 */
- (void)textNumberChange:(UITextField *)textField{
    if (_minFormZero && textField.text.integerValue < 0) {
        textField.text = @"";
    }
    if (!_minFormZero && textField.text.integerValue <= 0) {
        textField.text = @"";
    }
    
    if (textField.text.integerValue > _maxNum) {
        [self alertMessage:@"您输入的数量溢出，请重新输入"];
        textField.text = @"";
        return;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    _recordNum = textField.text;
    textField.text = @"";
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField.text.length == 0) {
        textField.text = _recordNum;
    }
    
    if (_minFormZero) {
        if (textField.text.integerValue>=0) {
            textField.text=[NSString stringWithFormat:@"%ld",(long)(textField.text.integerValue/_multipleNum.integerValue)*_multipleNum.integerValue];
        }
    }else{
        if (textField.text.integerValue!=0)
        {
            if (textField.text.integerValue/_multipleNum.integerValue == 0) {//输入小于基本值
                textField.text=[NSString stringWithFormat:@"%@",_multipleNum];
            }else{
                textField.text=[NSString stringWithFormat:@"%ld",(long)(textField.text.integerValue/_multipleNum.integerValue)*_multipleNum.integerValue];
            }
        }
    }
    
    [self callBackResultNumber:textField.text];
}

- (void)callBackResultNumber:(NSString *)number{
    if (self.resultNumber) {
        self.resultNumber(number);
    }
    
    if ([self.delegate respondsToSelector:@selector(resultNumber:)]) {
        [self.delegate resultNumber:number];
    }
}


/** 限制输入数字 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}


/** 抖动动画 */
- (void)shakeAnimation
{
    if (_isShake) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        //获取当前View的position坐标
        CGFloat positionX = self.layer.position.x;
        //设置抖动的范围
        animation.values = @[@(positionX-4),@(positionX),@(positionX+4)];
        //动画重复的次数
        animation.repeatCount = 3;
        //动画时间
        animation.duration = 0.07;
        //设置自动反转
        animation.autoreverses = YES;
        [self.layer addAnimation:animation forKey:nil];
    }
}


/** 提示 */
- (void)alertMessage:(NSString *)message
{
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

/** setter getter */
- (void)setBaseNum:(NSString *)baseNum{
    _baseNum=baseNum;
    [self setView];
}

- (void)setMultipleNum:(NSString *)multipleNum{
    _multipleNum=multipleNum;
}

- (void)setHidBorder:(BOOL)hidBorder{
    _hidBorder=hidBorder;
    [self setView];
}

- (void)setNumborderColor:(UIColor *)numborderColor{
    _numborderColor=numborderColor;
    [self setView];
}

- (void)setIsShake:(BOOL)isShake{
    _isShake=isShake;
}

- (void)setMinFormZero:(BOOL)minFormZero{
    _minFormZero=minFormZero;
}

- (void)setMaxNum:(NSInteger)maxNum{
    _maxNum=maxNum;
}

@end
