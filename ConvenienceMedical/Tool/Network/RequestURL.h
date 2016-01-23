//
//  RequestURL.h
//  LimiteFree
//
//  Created by 张树青 on 16/1/21.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

//网络数据请求地址的宏

#ifndef LimiteFree_RequestURL_h
#define LimiteFree_RequestURL_h

#define BASE_URL @""
//如果项目中使用的后台是同一个域名 那么 每一个接口的前缀是相同的 可以把相同的前缀放到baseURL中 不同的部分再放在不同的宏中

//注册
#define URL_REGIST @"http://www.dzwsyl.com/home/regist.htm"

//登录
#define URL_LOGIN  @"http://www.dzwsyl.com/home/login.htm"

//医院展示
#define URL_HOSPITAL_SHOW @"http://www.dzwsyl.com/home/hospital_show_list.htm"

#endif
