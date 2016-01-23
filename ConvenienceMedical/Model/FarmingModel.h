//
//  FarmingModel.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/20.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

//新农合接口信息列表

#import "JSONModel.h"

@interface FarmingModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *content;
@property (nonatomic, copy) NSString<Optional> *loginId;
@end
