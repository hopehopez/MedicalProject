//
//  EmergencyCallCell.h
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/20.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSQAlertView.h"

typedef void (^CellBlock)(NSString *);

@interface EmergencyCallCell : UITableViewCell
@property (nonatomic, copy) CellBlock block;

@property (weak, nonatomic) IBOutlet UILabel *hospitalNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UIButton *callBtn;
- (IBAction)callClick:(id)sender;


@end
