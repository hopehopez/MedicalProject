//
//  NoticeModel.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/25.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "NoticeModel.h"

@implementation NoticeModel


+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"ID"}];
}

@end
