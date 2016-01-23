//
//  ZSQCollectionViewCell.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/19.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSQCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *title;
//展示文字

@property (nonatomic, strong) UIImageView *iconImageView;
//展示图片

- (void)reloadCellWithImage:(NSString *)imageName;
@end
