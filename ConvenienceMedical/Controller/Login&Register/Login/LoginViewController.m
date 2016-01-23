//
//  LoginViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/14.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "LoginViewController.h"
#import "ZSQTextField.h"
#import "RegisterViewController.h"

@interface LoginViewController () <ZSQAlertViewDelegate>

@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) ZSQTextField *account;
@property (nonatomic, strong) ZSQTextField *pwd;
@property (nonatomic, strong) UIButton *loginBtn;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = @"登录";
    
    [self prepareView];
    
    
}

#pragma mark - 设置bannerImageView
- (void)prepareView{
    //banner
    _bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 180)];
    UIImage *image = [UIImage imageNamed:@"lunbotu_hb.png"];
    _bannerImageView.image = image;
    [self.view addSubview:_bannerImageView];
    
    //account
    CGRect rect = self.bannerImageView.frame;
    _account = [[ZSQTextField alloc] initWithFrame:CGRectMake(20, rect.origin.y + rect.size.height+20, SCREEN_WIDTH -40, 50)];
    _account.imageView.image = [UIImage imageNamed:@"phone.png"];
    UIColor *color = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    _account.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入账户" attributes:@{NSForegroundColorAttributeName: color}];
    [self.view addSubview:_account];
    
    //pwd
    _pwd = [[ZSQTextField alloc] initWithFrame:CGRectMake(20, rect.origin.y + rect.size.height + 70, SCREEN_WIDTH -40, 50)];
    _pwd.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: color}];
    
    _pwd.textField.secureTextEntry = YES;
    _pwd.imageView.image = [UIImage imageNamed:@"suo.png"];
    [self.view addSubview:_pwd];
    
    //loginBtn
    CGRect rect2 = _pwd.frame;
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, rect2.origin.y + rect2.size.height + 30, SCREEN_WIDTH - 40, 50)];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"anniu.png"] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    //regist
    CGRect rect3 = _loginBtn.frame;
    UIButton *registBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, rect3.origin.y + rect3.size.height + 20, 60, 30)];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor colorWithRed:0 green:169/255.0 blue:155/255.0 alpha:1] forState:UIControlStateHighlighted];
    [registBtn addTarget:self action:@selector(registClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    //fogetPwd
    UIButton *fogetBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 30 - 90, rect3.origin.y + rect3.size.height + 20, 80, 30)];
    [fogetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [fogetBtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [fogetBtn setTitleColor:[UIColor colorWithRed:0 green:169/255.0 blue:155/255.0 alpha:1] forState:UIControlStateHighlighted];
    [self.view addSubview:fogetBtn];
}

#pragma mark - 登录
- (void)loginClick:(id)sender{
    NSString *account = _account.textField.text;
    NSString *pwd = _pwd.textField.text;
    
    NSString *message = nil;
    if (account.length == 0) {
        message = @"请填写用户名";
    }else if(account.length<4 && account.length >16){
        message = @"请输入4-16位的用户名";
    }else if(pwd.length<6){
        message = @"\n密码不能少于6位\n";
    }
    
    if(message){
        ZSQAlertView *alertView = [[ZSQAlertView alloc] initWithTitle:@"提示" message:message delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [self.view addSubview:alertView];
        _account.textField.text = nil;
        _pwd.textField.text = nil;
        
    }else{
        
        NSDictionary *dict = @{@"loginId": account,
                               @"password": pwd};
        
        [BaseHttpClient httpType:POST andURL:URL_LOGIN andParameters:dict andSuccessBlock:^(NSURL *url, NSDictionary *data) {
            NSString *retCode = dict[@"ret_code"];
            if ([retCode isEqualToString:@"0"]){
                NSLog(@"登录成功");
                [ZSQStorage setLogin:1];
                
                //记录当前登录用户 以备使用
                NSDictionary *userDict = @{@"loginId": account,
                                           @"password": pwd};
                [ZSQStorage setCurrentUser:userDict];
                
                [self dismissViewControllerAnimated:YES completion:^{
                    _account.textField.text = nil;
                    _pwd.textField.text = nil;
                    
                }];
                
            }else {
                NSString *message = dict[@"message"];
                ZSQAlertView *alertView = [[ZSQAlertView alloc] initWithTitle:@"提示" message:message delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [self.view addSubview:alertView];
                _account.textField.text = nil;
                _pwd.textField.text = nil;
            }
            
        } andFailBlock:^(NSURL *url, NSError *error) {
            NSLog(@"登录出错");
        }];
        
        
    }
    
    
    
}

#pragma mark - ZSQAlertDelegate
- (void)selectedIndex:(NSInteger)index{
    
}

#pragma mark - 注册
- (void)registClick:(UIButton *)btn{
    RegisterViewController *regist = [[RegisterViewController alloc] init];
    
    [self.navigationController pushViewController:regist animated:YES];
}

#pragma mark - touchedBegin
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_pwd.textField endEditing:YES];
    [_account.textField endEditing:YES];
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
