//
//  HospitalViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/25.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "HospitalViewController.h"

@interface HospitalViewController ()

@end

@implementation HospitalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tabBarView setTabBarViewHidden:YES];
    
    self.titleLabel.text = _hospitalModel.hospitalName;
    
    [self createBackBtn];
    
    self.nameLabel.text = _hospitalModel.hospitalName;
    self.addressLabel.text = _hospitalModel.address;
    self.callLabel.text = _hospitalModel.lxdh;
    self.emergencyCallLabel.text = @"120";
    [self.hospitalImageView sd_setImageWithURL:[NSURL URLWithString: _hospitalModel.photo ] placeholderImage:nil options:SDWebImageRefreshCached];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tabBarView setTabBarViewHidden:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
