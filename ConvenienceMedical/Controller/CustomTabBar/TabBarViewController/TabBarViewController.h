//
//  TabBarViewController.h
//  ZSQDemo
//
//  Created by 张树青 on 15/12/26.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ITEM_COUNT 3

@interface TabBarViewController : UITabBarController

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) NSMutableArray *titlesArray;
@property (nonatomic, strong) NSMutableArray *normalImageArray;
@property (nonatomic, strong) NSMutableArray *selectedImageArray;
@property (nonatomic, strong) NSMutableArray *controllerArray;

@property (nonatomic, strong) UIView *tabBarView;

/**
指定初始化方法
 */
- (instancetype)initWithNormalColcor:(UIColor *)normalColor
                     andSelectdColor:(UIColor *)selectedColor
                           andTitles:(NSArray *)titlesArray
                 andNormalImageArray:(NSArray *)normalImageArray
               andSelectedImageArray:(NSArray *)selectedImageArray
                  andControllerArray:(NSArray *)controllerArray;
/**
 * 设置分栏导航条
 */
- (void)setTabBar;
/**
 *  绑定控制器
 */
- (void)setControllers;
/**
 *设置TabBar是否隐藏
 */
- (void)setTabBarViewHidden:(BOOL)hidden;
/**
 *  返回tabBar的高度
 */
- (float)getTabBarHeight;
@end
