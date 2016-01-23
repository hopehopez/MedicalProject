//
//  ZSQLunBoView.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/15.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "ZSQLunBoView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define COUNT (3 + 2)
@implementation ZSQLunBoView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createScrollView];
        
        [self createPageControl];
        
        [self setScrollContentWithPage:0];
        
        [self createTimer];
    }
    
    return self;
}

#pragma mark - 创建 SrcollView
- (void)createScrollView{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * COUNT, self.scrollView.frame.size.height);
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor orangeColor];
    
    _namesArr = [NSMutableArray array];
    for (int i=0; i<COUNT-2; i++) {
        NSString *name = [NSString stringWithFormat:@"banner%d.png", i+1];
        [_namesArr addObject:name];
    }
    
    _imageViewArr = [NSMutableArray array];
    for (int i= 0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        
        [_imageViewArr addObject:imageView];
        
        [_scrollView addSubview:imageView];
    }
    
    [self addSubview:_scrollView];
}

#pragma mark - 创建pageControl
- (void)createPageControl{
    
    CGRect rect = _scrollView.frame;
    
    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, rect.origin.y + rect.size.height - 20, SCREEN_WIDTH, 20)];
    _pageCtrl.numberOfPages = COUNT - 2;
    // _pageCtrl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    _pageCtrl.currentPage = 0;
    [self addSubview:_pageCtrl];
}

#pragma mark - 设置定时器
- (void)createTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
    
}

#pragma mark - 定时器 runTime方法
- (void)runTime{
    BOOL flag = NO;
    int page = _scrollView.contentOffset.x/SCREEN_WIDTH + 1;
    if (page == 0 || page == COUNT -1) {
        if (page == 0) {
            page = COUNT-2;
        }else {
            page = 1;
        }
        flag = YES;
    }
    [self setScrollContentWithPage:page-1];
    _pageCtrl.currentPage = page-1;
    if (flag) {
        _scrollView.contentOffset = CGPointMake(page * SCREEN_WIDTH, 0);
    }else{
        [_scrollView setContentOffset: CGPointMake(_scrollView.contentOffset.x+SCREEN_WIDTH, 0) animated:YES];
    }
    
}

#pragma mark - 根据page设置图片
- (void)setScrollContentWithPage:(int)page{
    int indexA = (page + (COUNT-2) -1)%(COUNT - 2);
    
    for (int i = 0; i<_imageViewArr.count; i++) {
        UIImageView *imageView = _imageViewArr[i];
        NSString *name = _namesArr[(indexA + i) % (COUNT -2)];
        UIImage *image = [UIImage imageNamed:name];
        
        imageView.image = image;
        imageView.frame = CGRectMake((page+i)*SCREEN_WIDTH, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    
}

#pragma mark -  scrollView 代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    BOOL flag = NO;
    int page = scrollView.contentOffset.x / SCREEN_WIDTH;
    if (page == 0 || page == COUNT -1) {
        if (page == 0) {
            page = COUNT-2;
        }else {
            page = 1;
        }
        flag = YES;
    }
    [self setScrollContentWithPage:page -1];
    _pageCtrl.currentPage = page-1;
    if (flag) {
        _scrollView.contentOffset = CGPointMake(page * SCREEN_WIDTH, 0);
    }
}


@end
