//
//  MineViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/8.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "MineViewController.h"
#import "PersonalCell.h"
#import "OptionalCell.h"

@interface MineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *exitBtn;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = @"我的";
    
    [self createTableView];
    [self loadData];
    
    [self createExitBtn];
    
   
}

#pragma mark - create tableView
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];

    
    UINib *nib1 = [UINib nibWithNibName:@"PersonalCell" bundle:nil];
    [_tableView registerNib:nib1 forCellReuseIdentifier:@"PersonalCell"];
    
    
    UINib *nib2 = [UINib nibWithNibName:@"OptionalCell" bundle:nil];
    [_tableView registerNib:nib2 forCellReuseIdentifier:@"OptionalCell"];
    [self.view addSubview:_tableView];
}

#pragma mark - create exitBtn
- (void)createExitBtn{
    _exitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 200, SCREEN_WIDTH, 50)];
    
    [_exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [_exitBtn setTitleColor:BASE_COLOR forState:UIControlStateNormal];
    
    _exitBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _exitBtn.backgroundColor = [UIColor whiteColor];
    
    [_exitBtn addTarget:self action:@selector(exitClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_exitBtn];
}

#pragma mark - loadData
-  (void)loadData{
    _dataArray = [NSMutableArray array];
    
    NSDictionary *dict = @{@"name":@"张三",
                           @"tel":@"123456789"};
    [_dataArray addObject:dict];
    
    NSArray *optionsArray = @[@"常用就诊人", @"交易记录", @"修改密码", @"意见反馈"];
    NSArray *imagesArray = @[@"changyongguahaoren.png", @"jiaoyijilu.png", @"xiugaimima.png", @"yijianfankui.png"];
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0 ; i<optionsArray.count; i++) {
        NSDictionary *dic = @{@"option": optionsArray[i],
                              @"imageName": imagesArray[i]};
        [mArray addObject:dic];
    }
   
    [_dataArray addObject:mArray];
    
    [_tableView reloadData];
}

#pragma mark - data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else {
        return 4;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        static NSString *personalCellID = @"PersonalCell";
        PersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCellID];
        if (!cell) {
            cell = [[PersonalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCellID];
        }
        NSDictionary *dict = _dataArray[indexPath.section];
        cell.userName.text = dict[@"name"];
        cell.tel.text = dict[@"tel"];
        
        return cell;
    }else {
        static NSString *optionCellID = @"OptionalCell";
        OptionalCell *cell2 = [tableView dequeueReusableCellWithIdentifier:optionCellID];
        if (!cell2) {
            cell2 = [[OptionalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionCellID];
          
        }
        NSArray *array = _dataArray[indexPath.section];
        NSDictionary *dic = array[indexPath.row];
        
        cell2.optionLabel.text = dic[@"option"];
        cell2.iconImageView.image = [UIImage imageNamed:dic[@"imageName"]];
        
        return cell2;
    }
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 50;
    }
}

#pragma mark - exitBtn Click
- (void)exitClick:(id)sender{
    
    [ZSQStorage setLogin:0];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN" object:nil];
    
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
