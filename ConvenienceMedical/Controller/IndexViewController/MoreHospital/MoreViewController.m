//
//  MoreViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/27.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger selected;

@property (nonatomic, strong) NSArray *categoryArray;
@property (nonatomic, strong) NSArray *levelArray;
@property (nonatomic, strong) NSArray *distanceArray;
@end

@implementation MoreViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.tabBarView setTabBarViewHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = @"医院列表";
    [self createBackBtn];
    _selected = 0;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self setArraysData];
    
    [self loadData];
}

#pragma mark - 填充数组数据
- (void)setArraysData{
    _categoryArray = @[@"市级医院", @"省级医院", @"中心卫生院", @"乡镇卫生院", @"民营医院卫生院", @"社区（村）卫生室", @"部队医院"];
    _levelArray = @[@"三级", @"二级"];
}

#pragma mark - loadData
- (void)loadData{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }else{
        [_dataArray removeAllObjects];
    }
    
    NSDictionary *dict = @{@"type":@(_selected + 1)};
    [BaseHttpClient httpType:POST andURL:URL_HOSPITAL_LIST andParameters:dict andSuccessBlock:^(NSURL *url, NSDictionary *data) {
        
        NSArray *array = data[@"data"];
        for (NSDictionary *dict  in array) {
            NSArray *array = dict[@"keyValue"];
           
            NSMutableArray *mArray = [NSMutableArray array];
            for (NSDictionary *dict1 in array) {
                 HospitalModel *model = [[HospitalModel alloc] initWithDictionary:dict1 error:nil];
                [mArray addObject:model];
            }
            
            [_dataArray addObject:mArray];
        }
        
        [self.tableView reloadData];
        
    } andFailBlock:^(NSURL *url, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = _dataArray[section];
    return  array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSArray *array = _dataArray[indexPath.section];
    HospitalModel *model = array[indexPath.row];
    
    cell.textLabel.text = model.hospitalName;
    return cell;
    
}

#pragma mark - delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:view.bounds];
    bgImageView.image = [UIImage imageNamed:@"juxingda_a"];
    [view addSubview:bgImageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 200, 30)];
    label.textColor = BASE_COLOR;
    [view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 15, 15, 10)];
    imageView.image = [UIImage imageNamed:@"xiangxiajiantou_a"];
    [view addSubview:imageView];
    
    if (_selected == 0) {
        label.text = _categoryArray[section];
    }
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
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
