//
//  ZSQStorage.m
//  ZSQDemo
//
//  Created by 张树青 on 15/12/28.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import "ZSQStorage.h"


@implementation ZSQStorage

#pragma  mark - 获取沙盒路径
+ (NSString *)getPath:(NSString *)fileName{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = array[0];
    NSString *path = [documentPath stringByAppendingPathComponent:fileName];
    
    return path;
}


#pragma mark - 设置为已安装
+ (void)install{
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"install"];
}
#pragma mark - 判断是否安装
+ (NSInteger)isInstall{
    return  [[NSUserDefaults standardUserDefaults] integerForKey:@"install"];
}

#pragma mark - 设置选中的item的index
+ (void)setItemSelectedIndex:(NSInteger)index{
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"itemSelected"];
}

#pragma mark - 获取选中的item的index
+ (NSInteger)getItemSelectedIndex{
  return  [[NSUserDefaults standardUserDefaults] integerForKey:@"itemSelected"];
}

#pragma mark - 获取main页面中展示的plist数据
+ (NSArray *)getAddressList{    
    return  nil;
}

#pragma mark - 获取用户头像 iconList
+ (NSArray *)getIconList{
    return nil;
}
#pragma mark - 设置用户登录状态
+ (void)setLogin:(NSInteger)login{
    [[NSUserDefaults standardUserDefaults] setInteger:login forKey:@"isLogin"];
}
#pragma mark - 获取用户登录状态
+ (NSInteger)getLogin{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"isLogin"];
}

#pragma mark - 存储主题
+ (void)setTheme:(NSString *)theme{
    [[NSUserDefaults standardUserDefaults] setObject:theme forKey:@"theme"];
}
#pragma mark - 获取主题
+ (NSString *)getTheme{
    NSObject *obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"theme"];
    if (obj) {
        return (NSString *)obj;
    }else{
        return @"bg1.jpg";
    }
}

#pragma mark - 记录当前登录用户
+ (void)setCurrentUser:(NSDictionary *)userDict{
    [[NSUserDefaults standardUserDefaults] setObject:userDict forKey:@"CurrentUser"];
}
#pragma mark - 获取当前登录用户
+ (NSDictionary *)getCurrentUser{
    NSObject *obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"CurrentUser"];
    if (obj) {
        return (NSDictionary *)obj;
    }else {
        return nil;
    }
}


@end
