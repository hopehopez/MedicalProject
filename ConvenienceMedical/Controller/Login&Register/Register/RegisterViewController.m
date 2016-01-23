//
//  RegisterViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/14.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "RegisterViewController.h"
#import "ZSQTextField.h"
@interface RegisterViewController () <ZSQAlertViewDelegate>

@property (nonatomic, strong) ZSQTextField *account;
@property (nonatomic, strong) ZSQTextField *pwd1;
@property (nonatomic, strong) ZSQTextField *pwd2;
@property (nonatomic, strong) UIButton *agreeBtn;
@property (nonatomic, strong) UIButton *nextBtn;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = @"注册";
    
    [self prepareView];
}

#pragma mark - prepareView
- (void)prepareView{
    
    //返回按钮
    UIImage *image = [UIImage imageNamed:@"jiantou_a.png"];
    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:newImage style:UIBarButtonItemStyleDone target:self action:@selector(backEvent:)];
    
    //横线
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64 + 9, SCREEN_WIDTH, 1)];
    imageView.image = [UIImage imageNamed:@"xian-c.png"];
    [self.view addSubview:imageView];
    
    //accout
    CGRect rect = imageView.frame;
    _account = [[ZSQTextField alloc] initWithFrame:CGRectMake(20, rect.origin.y + rect.size.height, SCREEN_WIDTH -40, 50)];
    _account.textField.placeholder = @"请输入用户名";
    UIColor *color = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    _account.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入用户名" attributes:@{NSForegroundColorAttributeName: color}];
    _account.imageView.image = [UIImage imageNamed:@"phone.png"];
    [self.view addSubview:_account];
    
    //pwd1
    _pwd1 = [[ZSQTextField alloc] initWithFrame:CGRectMake(20, rect.origin.y + rect.size.height + 50, SCREEN_WIDTH -40, 50)];
    _pwd1.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入6-16位无空格密码" attributes:@{NSForegroundColorAttributeName: color}];
    _pwd1.textField.secureTextEntry = YES;
    _pwd1.imageView.image = [UIImage imageNamed:@"suo.png"];
    [self.view addSubview:_pwd1];
    
    //pwd2
    _pwd2 = [[ZSQTextField alloc] initWithFrame:CGRectMake(20, rect.origin.y + rect.size.height + 100, SCREEN_WIDTH -40, 50)];
    _pwd2.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请确认密码" attributes:@{NSForegroundColorAttributeName: color}];
    _pwd2.textField.secureTextEntry = YES;
    _pwd2.imageView.image = [UIImage imageNamed:@"suo.png"];
    [self.view addSubview:_pwd2];
    
    //agreeBtn
    CGRect rect2 = _pwd2.frame;
    _agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, rect2.origin.y + rect2.size.height + 10, 20, 20)];
    [_agreeBtn setImage:[UIImage imageNamed:@"anniu2"] forState:UIControlStateNormal];
    [_agreeBtn setImage:[UIImage imageNamed:@"anniu1"] forState:UIControlStateSelected];
    _agreeBtn.selected = YES;
    [_agreeBtn addTarget:self action:@selector(agreeClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_agreeBtn];
    
    //label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, rect2.origin.y + rect2.size.height + 10, 85, 20)];
    label.text = @"我已阅读并同意";
    label.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label];
    
    //agreementbtn
    UIButton *agreementBtn = [[UIButton alloc] initWithFrame:CGRectMake(135, rect2.origin.y + rect2.size.height + 10, 120, 20)];
    [agreementBtn setTitle:@"《便民医疗注册协议》" forState:UIControlStateNormal];
    [agreementBtn setTitleColor:BASE_COLOR forState:UIControlStateNormal];
    agreementBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:agreementBtn];
    
    //下一步
    CGRect rect3 = _agreeBtn.frame;
    _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, rect3.origin.y + rect3.size.height + 30, SCREEN_WIDTH - 40, 50)];
    [_nextBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"anniu.png"] forState:UIControlStateNormal];
    [_nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextBtn];
}



#pragma mark - 返回事件
- (void)backEvent:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - agreeClick
- (void)agreeClick:(id)sender{
    _agreeBtn.selected ^= 1;
    if (_agreeBtn.selected) {
        _nextBtn.enabled = YES;
    }else {
        _nextBtn.enabled = NO;
    }
}

#pragma mark - nextClick
- (void)nextClick:(id)sender{
    NSString *account = _account.textField.text;
    NSString *pwd1 = _pwd1.textField.text;
    NSString *pwd2 = _pwd2.textField.text;
    
    NSString *message = nil;
    if (account.length == 0) {
        message = @"请填写用户名";
    }else if(account.length<4 && account.length >16){
        message = @"请输入4-16位的用户名";
    }else if(pwd1.length<6){
        message = @"\n密码不能少于6位\n";
    }else if (![pwd1 isEqualToString:pwd2]){
        message = @"\n两次输入密码不一致\n";
    }
    
    if(message){
        ZSQAlertView *alertView = [[ZSQAlertView alloc] initWithTitle:@"提示" message:message delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [self.view addSubview:alertView];
        _account.textField.text = nil;
        _pwd1.textField.text = nil;
        _pwd2.textField.text = nil;
    }else{
        
        NSDictionary *registDict = @{@"loginId": account,
                                     @"password": pwd1};
        
        [BaseHttpClient httpType:POST andURL:URL_REGIST andParameters:registDict andSuccessBlock:^(NSURL *url, NSDictionary *data) {
            NSString * message = data[@"message"];
            NSString *retCode = data[@"ret_Code"];
            if ([retCode isEqualToString:@"0"]) {
                ZSQAlertView *alertView = [[ZSQAlertView alloc] initWithTitle:@"提示" message:message delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [self.view addSubview:alertView];
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }else{
                _pwd1.textField.text = nil;
                _pwd1.textField.text = nil;
                _account.textField.text = nil;
            }
            
            ZSQAlertView *alertView = [[ZSQAlertView alloc] initWithTitle:@"提示" message:message delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [self.view addSubview:alertView];
            
        } andFailBlock:^(NSURL *url, NSError *error) {
            NSLog(@"注册失败");
        }];
        
    }
    
}

#pragma mark - ZSQAlertDelegate
- (void)selectedIndex:(NSInteger)index{
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_account.textField resignFirstResponder];
    [_pwd1.textField resignFirstResponder];
    [_pwd2.textField resignFirstResponder];
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
