//
//  PatientViewController.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/8.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "PatientViewController.h"
#import "ZSQCollectionViewCell.h"
@interface PatientViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation PatientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
       
    self.titleLabel.text = @"就诊人";
    
    [self createAddBtn];
    
    [self createCollectionView];
    
    [self loadData];

}

#pragma mark - 创建添加按钮
- (void)createAddBtn{
    UIImage *image = [UIImage imageNamed:@"circle---plus"];
    UIImage *newImage2 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:newImage2 style:UIBarButtonItemStylePlain target:self action:nil];
}

#pragma mark - 创建九宫格
- (void)createCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 100 , SCREEN_WIDTH -10, SCREEN_HEIGHT - 200) collectionViewLayout:layout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    layout.minimumInteritemSpacing = 5;
    //最小列间距
    layout.minimumLineSpacing = 5;
    //最小行间距
    
    _collectionView.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    [_collectionView registerClass:[ZSQCollectionViewCell class] forCellWithReuseIdentifier:@"CCellID"];
    
    [self.view addSubview:_collectionView];
    
}

#pragma mark - load Data
- (void)loadData{
    NSArray *array = @[@"zhouqitixing.png", @"jiuzhenjilu.png", @"bingliben.png", @"yuyueguahao.png", @"zhenjianzhifu.png", @"zhuanzhenshenqing.png", @"baogaochaxun.png", @"jiaozhuyuanfei.png", @"zaixianmaiyao.png"];
    _dataArray = [NSMutableArray arrayWithArray:array];
    [_collectionView reloadData];
}

#pragma mark - data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CCellID";
    ZSQCollectionViewCell *cell = (ZSQCollectionViewCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[ZSQCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    }
    
    [cell reloadCellWithImage:_dataArray[indexPath.row]];
    
    return cell;
}

#pragma mark - delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //选中cell时触发
    NSLog(@"%@", indexPath);
}

#pragma mark - layout delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //返回值是一个CGSize 表示cell的大小
    return CGSizeMake((SCREEN_WIDTH - 20)/3, (SCREEN_WIDTH - 20)/3);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
