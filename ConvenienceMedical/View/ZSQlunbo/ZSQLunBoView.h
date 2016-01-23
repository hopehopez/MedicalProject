//
//  ZSQLunBoView.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/15.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSQLunBoView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray *imageViewArr;
@property (nonatomic, strong) UIPageControl *pageCtrl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *namesArr;

@end
