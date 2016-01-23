//
//  EmergencyCallViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/20.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "EmergencyCallViewController.h"
#import "EmergencyCallCell.h"

@interface EmergencyCallViewController () <UITableViewDataSource, UITableViewDelegate, ZSQAlertViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSString *tel;
@end

@implementation EmergencyCallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"首页";
    
    //设置背景色
    self.view.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    
    [self createBackBtn];
    
    [self createTableView];
    [self loadData];
}

#pragma mark - 创建返回按钮
- (void)createBackBtn{
    
    //返回按钮
    UIImage *image = [UIImage imageNamed:@"jiantou_a.png"];
    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:newImage style:UIBarButtonItemStyleDone target:self action:@selector(backEvent:)];
}

#pragma mark 创建tableView
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -34, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //注册自定义cell
    UINib *nib = [UINib nibWithNibName:@"EmergencyCallCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"EmergencyCallCell"];
    
    [self.view addSubview:_tableView];
}

#pragma mark loadData
- (void)loadData{
    if (_dataArray) {
        [_dataArray removeAllObjects];
    }else{
        _dataArray = [NSMutableArray array];
    }
    
    [BaseHttpClient httpType:POST andURL:URL_HOSPITAL_SHOW andParameters:nil andSuccessBlock:^(NSURL *url, NSDictionary *data) {
        NSArray *array = data[@"data"];
        for (NSDictionary  *dict in array) {
            HospitalModel *hospital = [[HospitalModel alloc] initWithDictionary:dict error:nil];
            [_dataArray addObject:hospital];
        }
        [_tableView reloadData];
    } andFailBlock:^(NSURL *url, NSError *error) {
        NSLog(@"获取失败");
    }];
}

#pragma mark - data Source 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"EmergencyCallCell";
    
    EmergencyCallCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[EmergencyCallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    HospitalModel *model = _dataArray[indexPath.row];
    cell.hospitalNameLabel.text = model.hospitalName;
    cell.telLabel.text = model.lxdh;
    cell.block = ^(NSString *tel){
        ZSQAlertView *alertView = [[ZSQAlertView alloc] initWithTitle:nil message:@"是否拨打电话" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"]];
        _tel = tel;
        [self.view addSubview:alertView];
    };
    
    return cell;
}

- (void)selectedIndex:(NSInteger)index{
    
    NSString *telStr = [NSString stringWithFormat:@"%@%@", @"tel://", self.tel];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telStr]];
}

#pragma mark - delegate代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return 0;
}
#pragma mark - 返回事件
- (void)backEvent:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
