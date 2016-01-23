//
//  ZSQTextField.m
//  MyLogin
//
//  Created by 张树青 on 15/12/19.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import "ZSQTextField.h"

@implementation ZSQTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self draw:frame];
    }
    return self;
}

- (void)draw:(CGRect)frame{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    [self addSubview:_imageView];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 0, frame.size.width - 50, frame.size.height-1)];
    UIColor *color = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: color}];
    [self addSubview:_textField];
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, frame.size.width, 1)];
    lineImageView.image = [UIImage imageNamed:@"xian-c.png"];
    [self addSubview:lineImageView];
}
@end
