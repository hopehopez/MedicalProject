//
//  HospitalModel.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/15.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "JSONModel.h"

@interface HospitalModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *address;
@property (nonatomic, copy) NSString<Optional> *categoryId;
@property (nonatomic, copy) NSString<Optional> *categoryName;
@property (nonatomic, copy) NSString<Optional> *createDate;
@property (nonatomic, copy) NSString<Optional> *createrId;
@property (nonatomic, copy) NSString<Optional> *distance;
@property (nonatomic, copy) NSString<Optional> *enabled;
@property (nonatomic, copy) NSString<Optional> *hospitalName;
@property (nonatomic, copy) NSString<Optional> *ID;
@property (nonatomic, copy) NSString<Optional> *jd;
@property (nonatomic, copy) NSString<Optional> *wd;
@property (nonatomic, copy) NSString<Optional> *jjdh;
@property (nonatomic, copy) NSString<Optional> *levelId;
@property (nonatomic, copy) NSString<Optional> *levelName;
@property (nonatomic, copy) NSString<Optional> *lxdh;
@property (nonatomic, copy) NSString<Optional> *photo;
@property (nonatomic, copy) NSString<Optional> *sortName;
@property (nonatomic, copy) NSString<Optional> *tsdh;
@property (nonatomic, copy) NSString<Optional> *updateDate;
@property (nonatomic, copy) NSString<Optional> *userName;


@end
