//
//  IndexViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/8.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "IndexViewController.h"
#import "ZSQLunBoView.h"
#import "ZSQButton.h"
#import "ZSQTableViewCell.h"

@interface IndexViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) ZSQLunBoView *lunboView;
@property (nonatomic, strong) UIView *middleView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation IndexViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = @"首页";
    
    //创建tableView
    [self createTableView];
    
    //下载数据
    [self loadData];
    
    [self addRefresh];
}



#pragma mark - 创建middleView
- (void)createMiddleView{
    
    CGRect rect = _lunboView.frame;
    _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, rect.origin.y + rect.size.height, SCREEN_WIDTH, 80)];
    
    _middleView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    NSArray *titles = @[@"急救电话", @"新农合", @"医保"];
    NSArray *images = @[@"jijiudianhua.png", @"xinnonghe.png", @"yibao.png"];
    
    CGFloat margin = (SCREEN_WIDTH - 80 *3 - 30 *2)/2.0;
    for (int i = 0; i<3; i++) {
        ZSQButton *btn = [[ZSQButton alloc] initWithFrame:CGRectMake(25 + i * (80 + margin) , 0, 80, 80) andTitle:titles[i] andImage:images[i]];
        btn.tag = 500 +i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_middleView addSubview:btn];
    }
    
    [self.view addSubview:_middleView];
    
}


#pragma mark - 创建tableView
- (void)createTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_tableView];
}

#pragma mark - loadData
- (void)loadData{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    } else {
        [_dataArray removeAllObjects];
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

#pragma mark - dateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (ZSQTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    
    ZSQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[ZSQTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    HospitalModel *hospital = _dataArray[indexPath.row];
    
    cell.textLabel.text = hospital.hospitalName;
    cell.imageView.image = [UIImage imageNamed:@"yiyuannlogo"];
    
    UIButton *levelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [levelBtn setBackgroundImage:[UIImage imageNamed:@"yuanhu.png"] forState:UIControlStateNormal];
    [levelBtn setTitle:hospital.levelName forState:UIControlStateNormal];
    cell.accessoryView = levelBtn;
    return cell;
}

#pragma mark - delegate
//设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//自定义tableView的HeaderView
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 280;
}
//自定义headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //轮播视图
    _lunboView = [[ZSQLunBoView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    [self.view addSubview:_lunboView];
    
    //创建中间的视图
    [self createMiddleView];
    
    //创建 "更多" button 并设置样式
    CGRect rect = _middleView.frame;
    UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, rect.origin.y + rect.size.height , SCREEN_WIDTH, 50)];
    moreBtn.backgroundColor = [UIColor whiteColor];
    
    UILabel *hospitalLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 50)];
    hospitalLabel.text = @"医院";
    hospitalLabel.font = [UIFont systemFontOfSize:22];
    hospitalLabel.textColor = BASE_COLOR;
    [moreBtn addSubview:hospitalLabel];
    
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 20, 40, 20)];
    moreLabel.text = @"更多";
    moreLabel.textColor = [UIColor lightGrayColor];
    [moreBtn addSubview:moreLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 20, 10, 20)];
    imageView.image = [UIImage imageNamed:@"jiantou_zuo"];
    [moreBtn addSubview:imageView];
    
    UIImageView *lineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    lineImageView1.image = [UIImage imageNamed:@"xian-c.png"];
    [moreBtn addSubview:lineImageView1];
    
    UIImageView *lineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 1)];
    lineImageView2.image = [UIImage imageNamed:@"xian-c.png"];
    [moreBtn addSubview:lineImageView2];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 280)];
    
    [headerView addSubview:_lunboView];
    [headerView addSubview:_middleView];
    [headerView addSubview:moreBtn];
    
    return headerView;
    
}

#pragma mark - 下拉刷新
- (void)addRefresh{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
        [_tableView.header endRefreshing];
    }];
    
    [header setTitle:@"下拉可以刷新" forState:MJRefreshStatePulling];
    
    
    [header setTitle:@"快松手 要刷新啦" forState:MJRefreshStateRefreshing];
    
    _tableView.header = header;
}


#pragma mark - button 点击事件
- (void)btnClick:(UIButton *)btn{
    if (btn.tag == 500) {
        //急救电话
        UIViewController *emergencyView = [ZSQFactory createViewControllerWithName:@"EmergencyCallViewController"];
        [self.navigationController pushViewController:emergencyView animated:YES];
    }
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
