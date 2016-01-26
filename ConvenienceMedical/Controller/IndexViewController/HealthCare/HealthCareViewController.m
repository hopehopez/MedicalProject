//
//  HealthCareViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/25.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "HealthCareViewController.h"
#include "DetailViewController.h"
@interface HealthCareViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation HealthCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = @"新农合通知";
    
    [self.tabBarView setTabBarViewHidden:YES];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self createBackBtn];
    
    [self createTableView];
    
    [self loadData];

    
}

#pragma mark - 创建tableView
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -25, SCREEN_WIDTH, SCREEN_HEIGHT + 25) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.bounces = NO;
    
    UINib *nib = [UINib nibWithNibName:@"NotiCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"NotiCellID"];
    
    [self.view addSubview:_tableView];
}

#pragma mark - loadData
- (void)loadData{
    [BaseHttpClient httpType:POST andURL:URL_HEALTH_CARE andParameters:nil andSuccessBlock:^(NSURL *url, NSDictionary *data) {
        
        NSArray *array = data[@"data"];
        _dataArray = [NSMutableArray array];
        for (NSDictionary *dict  in array) {
            NoticeModel *model = [[NoticeModel alloc] initWithDictionary:dict error:nil];
            [_dataArray addObject:model];
        }
        
        [_tableView reloadData];
        
    } andFailBlock:^(NSURL *url, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

#pragma mark - data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"NotiCellID";
    NotiCell   *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NotiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NoticeModel *model = _dataArray[indexPath.row];
    cell.titleLabel.text = model.title;
    
    NSInteger dateNum = [model.createDate integerValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateNum/1000];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [df stringFromDate:date];
    
    cell.dateLabel.text = dateStr;
    
    return cell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NoticeModel *model = _dataArray[indexPath.row];
    DetailViewController *detailView = [[DetailViewController alloc] init];
    detailView.noticeContent = model.content;
    [self.navigationController pushViewController:detailView animated:YES];
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
