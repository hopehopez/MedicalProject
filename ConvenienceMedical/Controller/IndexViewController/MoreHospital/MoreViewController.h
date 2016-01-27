//
//  MoreViewController.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/27.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *categoryBtn;
@property (weak, nonatomic) IBOutlet UIButton *levelBtn;
@property (weak, nonatomic) IBOutlet UIButton *distanceBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
