//
//  HospitalViewController.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/25.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomButton.h"
@interface HospitalViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *hospitalImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *callLabel;
@property (weak, nonatomic) IBOutlet UILabel *emergencyCallLabel;

@property (weak, nonatomic) IBOutlet UIButton *hospitalInfo;
@property (weak, nonatomic) IBOutlet UIButton *hospitalNews;
@property (weak, nonatomic) IBOutlet UIButton *officeInfo;
@property (weak, nonatomic) IBOutlet UIButton *healthCheck;


@property (nonatomic, strong) HospitalModel *hospitalModel;


@end
