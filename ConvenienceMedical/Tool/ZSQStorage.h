//
//  ZSQStorage.h
//  ZSQDemo
//
//  Created by 张树青 on 15/12/28.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
/*
 数据操作类 增删改查 用户信息
 */
@interface ZSQStorage : NSObject
/*
 设置为安装
 */
+ (void)install;
/*
 判断是否安装
 */
+ (NSInteger)isInstall;
/*
 设置选中的item的index
 */
+ (void)setItemSelectedIndex:(NSInteger)index;
/*
 获取选中的item的index
 */
+ (NSInteger)getItemSelectedIndex;
/*
 获取main页面Address数据
 */
+ (NSArray *)getAddressList;
/**
 *  获取头像list数据
 */
+ (NSArray *)getIconList;
/**
 *  设置用户登录状态
 */
+ (void)setLogin:(NSInteger)login;
/**
 *  获取用户登录状态
 */
+ (NSInteger)getLogin;

/**
 *  存储主题
 */
+ (void)setTheme:(NSString *)theme;
/**
 *  获取主题
 */
+ (NSString *)getTheme;

/**
 *  记录当前登录用户
 */
+ (void)setCurrentUser:(NSDictionary *)userDict;
/**
 *  获取当前登录用户
 */
+ (NSDictionary *)getCurrentUser;
@end
