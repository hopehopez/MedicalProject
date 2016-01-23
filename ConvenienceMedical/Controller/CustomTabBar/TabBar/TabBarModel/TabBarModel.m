//
//  TabBarModel.m
//  ZSQDemo
//
//  Created by 张树青 on 15/12/26.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import "TabBarModel.h"

@implementation TabBarModel



+ (TabBarModel *)createTabBarModelWithDic:(NSDictionary *)dic{

    TabBarModel * model = [[TabBarModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

@end
