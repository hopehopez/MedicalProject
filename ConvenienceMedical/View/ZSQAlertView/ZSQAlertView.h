//
//  ELNAlertView.h
//  CustomAlertView
//
//  Created by 张树青 on 15/11/16.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZSQAlertViewDelegate<NSObject>

- (void)selectedIndex:(NSInteger)index;

@end

@interface ZSQAlertView : UIView




- (instancetype )initWithTitle:(NSString *)title message:(NSString *)message delegate:(id<ZSQAlertViewDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)buttonTitles;



@end
