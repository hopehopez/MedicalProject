//
//  ZSQButton.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/13.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "ZSQButton.h"

@implementation ZSQButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andImage:(NSString *)image{
    if (self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];

        //button的背景颜色
        
        //    在UIButton中有三个对EdgeInsets的设置：ContentEdgeInsets、titleEdgeInsets、imageEdgeInsets
        
        
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        self.imageEdgeInsets = UIEdgeInsetsMake(0, (self.frame.size.width - self.imageView.frame.size.width/2.0-3), 20, (self.frame.size.width - self.imageView.frame.size.width/2.0-3));
        //设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
        
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        //title字体大小
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //设置title的字体居中
        [self setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
        //设置title在一般情况下为白色字体
        [self setTitle:title forState:UIControlStateNormal];
        self.titleEdgeInsets = UIEdgeInsetsMake(55, - self.titleLabel.bounds.size.width-40, 0, 0);
        //设置title在button上的位置（上top，左left，下bottom，右right）
    }
    
    return self;
}
@end
