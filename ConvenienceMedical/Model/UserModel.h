//
//  UserModel.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/16.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "JSONModel.h"

@interface UserModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *loginId;
@property (nonatomic, copy) NSString<Optional> *password;
@property (nonatomic, copy) NSString<Optional> *userName;
@property (nonatomic, copy) NSString<Optional> *birthday;
@property (nonatomic, copy) NSString<Optional> *phoneNo;
@property (nonatomic, copy) NSString<Optional> *email;
@property (nonatomic, copy) NSString<Optional> *homeAddress;

@end
