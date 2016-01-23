//
//  TabBarModel.h
//  ZSQDemo
//
//  Created by 张树青 on 15/12/26.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TabBarModel : NSObject
@property (nonatomic,copy)NSString * title;

@property (nonatomic,retain)UIColor * colorNormal;

@property (nonatomic,retain)UIColor * colorSelected;

@property (nonatomic,copy)NSString * imageNameNormal;

@property (nonatomic,copy)NSString * imageNameSelected;



+ (TabBarModel *)createTabBarModelWithDic:(NSDictionary *)dic;

@end
