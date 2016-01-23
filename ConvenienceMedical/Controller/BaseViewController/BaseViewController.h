//
//  BaseViewController.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/8.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"


@interface BaseViewController : UIViewController
@property (nonatomic, weak) TabBarViewController *tabBarView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
