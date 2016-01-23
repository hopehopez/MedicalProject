//
//  BaseViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/8.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0 green:169/255.0 blue:155/255.0 alpha:1];
    
    self.tabBarView = (TabBarViewController *)self.tabBarController;
    
    //设置背景色
     self.view.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    
    //状态栏设为白色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //设置navigationBar背景图片
    UIImage *image = [UIImage imageNamed:@"dhbj"];
    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.navigationController.navigationBar setBackgroundImage:newImage forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.titleView.center = CGPointMake( SCREEN_WIDTH/2, 22);
    
    //自定义title样式
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(([self.title length] < 10 ?NSTextAlignmentCenter : NSTextAlignmentCenter), 0, 150, 44)];
    //_titleLabel.backgroundColor = [UIColor orangeColor];
    _titleLabel.center = CGPointMake(SCREEN_WIDTH/2, 22);
    _titleLabel.font = [UIFont systemFontOfSize:23];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text=self.title;
    self.navigationItem.titleView = _titleLabel;
    
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
