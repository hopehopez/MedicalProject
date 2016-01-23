//
//  EmergencyCallCell.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/20.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "EmergencyCallCell.h"


@implementation EmergencyCallCell 

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)callClick:(id)sender {
    
    self.block(self.telLabel.text);
    
}



@end
