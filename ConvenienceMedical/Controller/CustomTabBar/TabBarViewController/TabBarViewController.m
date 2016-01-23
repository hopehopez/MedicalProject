//
//  TabBarViewController.m
//  ZSQDemo
//
//  Created by 张树青 on 15/12/26.
//  Copyright (c) 2015年 zsq. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBarItem.h"
#import "ZSQFactory.h"
#import "ZSQStorage.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (instancetype)initWithNormalColcor:(UIColor *)normalColor
                     andSelectdColor:(UIColor *)selectedColor
                           andTitles:(NSArray *)titlesArray
                 andNormalImageArray:(NSArray *)normalImageArray
               andSelectedImageArray:(NSArray *)selectedImageArray
                  andControllerArray:(NSArray *)controllerArray{
    if (self = [super init]) {
        _normalColor = normalColor;
        _selectedColor = selectedColor;
        
        _normalImageArray = [NSMutableArray arrayWithArray:normalImageArray];
        _selectedImageArray = [NSMutableArray arrayWithArray:selectedImageArray];
        
        _titlesArray = [NSMutableArray arrayWithArray:titlesArray];
        _controllerArray = [NSMutableArray arrayWithArray:controllerArray];
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏自带tabBar
    self.tabBar.hidden = YES;
    
}

#pragma mark - 创建tabBar
- (void)setTabBar{
    
    _tabBarView = [[[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:self options:nil] firstObject];
    //根据主目录路径创建关联
    
    CGRect rect = self.view.frame;
    float h = rect.size.height - _tabBarView.bounds.size.height;
    _tabBarView.frame = CGRectMake(0, h, rect.size.width, _tabBarView.frame.size.height);
    
    NSMutableArray *modelArray = [NSMutableArray array];
    
    for (int i = 0; i<ITEM_COUNT; i++) {
        //将button的属性值存入字典 key值必须保证与model属性值一一对应
        NSDictionary *dict = @{@"title":_titlesArray[i],
                               @"colorNormal":_normalColor,
                               @"colorSelected":_selectedColor,
                               @"imageNameNormal":_normalImageArray[i],
                               @"imageNameSelected":_selectedImageArray[i]
                               };
        //创建model存储数据 用以创建TabBarItem
        TabBarModel *model = [TabBarModel createTabBarModelWithDic:dict];
        [modelArray addObject:model];
    }
    
    for (UIView *view in _tabBarView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            //isKindOfClass 是否是某个类或者子类的对象
            //isMemberOfClass 是否是某个类的对象 不包含子类的对象
            
            //将获取的button对象强转为 TabBarItem
            TabBarItem *btn = (TabBarItem *)view;
            
            //通过model里存储的数据为btn设置各属性值(title color image)
            [btn setTabBarItemWithModel:modelArray[btn.tag-1000]];
            //添加点击事件
            [btn addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    [self.view addSubview:_tabBarView];
}

#pragma mark - 创建控制器 
- (void)setControllers{
    NSMutableArray *navs = [NSMutableArray array];
    for ( NSString *ctrName in _controllerArray) {
        UIViewController *vc = [ZSQFactory createViewControllerWithName:ctrName];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [navs addObject:nav];
    }
    self.viewControllers = [navs copy];
}

#pragma mark -- selectedIndex属性的set方法 创建分栏控制器 该方法会被调用一次
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    
    static int flag = 0;
    if (flag == 0) {//根据用户偏好设置 默认选中之前选中的item 仅当第一次进入时执行
        TabBarItem *btn = (TabBarItem *)[_tabBarView viewWithTag:1000 + [ZSQStorage getItemSelectedIndex]];
        btn.selected = YES;
        flag++;
    }
}

#pragma mark - button itemSelectd
- (void)itemSelected:(TabBarItem *)btn{
    
    if (btn.tag == self.selectedIndex + 1000) {
        return ;
    }
    
    for (UIView *view in _tabBarView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            TabBarItem *button = (TabBarItem *)view;
            if (btn.tag == button.tag) {
                
                button.selected = YES;
                self.selectedIndex = button.tag - 1000;
                [self.delegate tabBarController:self didSelectViewController:self.selectedViewController];
            }else {
                button.selected = NO;
            }
        }
    }
}

- (void)setTabBarViewHidden:(BOOL)hidden{
    
    _tabBarView.hidden = hidden;
}
- (float)getTabBarHeight{
    return self.tabBarView.frame.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
