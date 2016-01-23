//
//  ZSQTableViewCell.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/16.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "ZSQTableViewCell.h"

@implementation ZSQTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 79, [UIScreen mainScreen].bounds.size.width-40, 1)];
        imageView.image = [UIImage imageNamed:@"xian-c.png"];
        [self addSubview:imageView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
