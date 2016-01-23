//
//  TabBarItem.m
//  ProjectDemo
//  ZSQDemo
//
//  Created by 张树青 on 15/12/26.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem

//设置Item
- (void)setTabBarItemWithModel:(TabBarModel *)model{
    //title
    [self setTitle:model.title forState:UIControlStateNormal];
    
    [self setTitleColor:model.colorNormal forState:UIControlStateNormal];
    
    [self setTitleColor:model.colorSelected forState:UIControlStateHighlighted];
    
    [self setTitleColor:model.colorSelected forState:UIControlStateSelected];
    
    //image
    UIImage * image0 = [UIImage imageNamed:model.imageNameNormal];
    //设置图片保持最初颜色 不受镂空色影响
    UIImage * imageNew0 = [image0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setImage:imageNew0 forState:UIControlStateNormal];
    
    UIImage * image = [UIImage imageNamed:model.imageNameSelected];
    UIImage * imageNew = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setImage:imageNew forState:UIControlStateHighlighted];
    [self setImage:imageNew forState:UIControlStateSelected];
    
    //titleLabel
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    //去掉镂空色
    self.tintColor = [UIColor clearColor];
}

#pragma mark - 设置button上面是图片下面是title
//设置titleLabel显示的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    //contentRect button自己的位置
    //返回的是titleLabel的位置
    
    return CGRectMake(0, contentRect.size.height-21, contentRect.size.width, 21);
    //设置titleLabel显示位置在图片下方 并设置高度为21
}
//设置image显示的位置 必须使用setImage才会被调用 而不是setBackgroundImage

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(8, 5, contentRect.size.width - 16, contentRect.size.height - 25);
    //设置button前景图片距离button上边界5 下边界25
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
