//
//  NoticeModel.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/25.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "JSONModel.h"

@interface NoticeModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *content;
@property (nonatomic, copy) NSString<Optional> *createDate;
@property (nonatomic, copy) NSString<Optional> *enabled;
@property (nonatomic, copy) NSString<Optional> *ID;
@property (nonatomic, copy) NSString<Optional> *picDir;
@property (nonatomic, copy) NSString<Optional> *releaseDate;
@property (nonatomic, copy) NSString<Optional> *title;
@property (nonatomic, copy) NSString<Optional> *updateDate;
@end
