//
//  CustomButton.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/26.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGRect buttonRect = self.bounds;
    CGRect titleRect = self.titleLabel.bounds;
    CGRect imageRect = self.imageView.bounds;
    return CGRectMake((buttonRect.size.width - titleRect.size.width) /2.0,
                      (buttonRect.size.height - titleRect.size.height - imageRect.size.height) / 2 + imageRect.size.height + 5,
                      titleRect.size.width,
                      titleRect.size.height);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect buttonRect = self.bounds;
    CGRect titleRect = self.titleLabel.bounds;
    CGRect imageRect = self.imageView.bounds;
    return CGRectMake((buttonRect.size.width - titleRect.size.width) /2.0,
                      (buttonRect.size.height - titleRect.size.height - imageRect.size.height) / 2,
                      titleRect.size.width,
                      titleRect.size.height);
}

@end
