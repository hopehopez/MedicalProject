//
//  AppDelegate.m
//  ConvenienceMedical
//
//  Created by 张树青 on 16/1/8.
//  Copyright (c) 2016年 zsq. All rights reserved.
//

#import "AppDelegate.h"

#import "TabBarViewController.h"
#import "LoginViewController.h"
@interface AppDelegate () <UITabBarControllerDelegate>
@property (nonatomic,retain)TabBarViewController * tabBarView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [ZSQStorage install];
    [ZSQStorage setLogin:1];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.rootViewController = [self setTabBarController];
    
    _window.backgroundColor = [UIColor whiteColor];
    
    [_window makeKeyAndVisible];
    
    return YES;
}
#pragma mark -- 创建分栏控制器
- (TabBarViewController *)setTabBarController{
    NSArray * controllers = @[@"IndexViewController", @"PatientViewController", @"MineViewController"];
    
    NSArray * titles = @[@"首页", @"就诊人", @"我的"];
    
    NSArray * normals = @[@"index1.png", @"find2.png", @"mine2.png"];
    
    NSArray * selecteds = @[@"index2.png", @"find1.png", @"mine1.png"];
    
    UIColor * normal = [UIColor colorWithRed:169/255.0 green:169/255.6 blue:169/255.0 alpha:1];
    UIColor * selected = [UIColor colorWithRed:0/255.0 green:169/255.6 blue:155/255.0 alpha:1];
    
    _tabBarView = [[TabBarViewController alloc] initWithNormalColcor:normal andSelectdColor:selected andTitles:titles andNormalImageArray:normals andSelectedImageArray:selecteds andControllerArray:controllers];
    [_tabBarView setTabBar];
    [_tabBarView setControllers];
    
    _tabBarView.delegate = self;
    
    _tabBarView.selectedIndex = [ZSQStorage getItemSelectedIndex];
    
    return _tabBarView;
}

#pragma mark - tabBar 代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    //每次选中tabBarItem  更新用户偏好
    [ZSQStorage setItemSelectedIndex:tabBarController.selectedIndex];
    if (tabBarController.selectedIndex != 0) {
        [self setLoginView];
    }
}

#pragma mark - 注册通知 监听用户是否登录
- (void)registNotification{
    
    //注册通知 用户退出时 弹出登录页
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openApp:) name:@"LOGIN" object:nil];
}

#pragma mark - 监听的方法
- (void)openApp:(NSNotification *)noti{
    //设置默认选中
    [ZSQStorage setItemSelectedIndex:0];
    
    //退出后回到首页
    self.tabBarView.selectedIndex = 0;
    //选中首页button
    for (UIView *view in  self.tabBarView.tabBarView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            if (button.tag == 1000) {
                button.selected = YES;
            }else {
                button.selected = NO;
            }
        }
    }

}
#pragma mark - 创建登录页
- (void)setLoginView{
    NSInteger login = [ZSQStorage getLogin];
    if (!login && [ZSQStorage isInstall] && _tabBarView.selectedIndex != 0) {
        LoginViewController *loginView = [[LoginViewController alloc] init];
        
       
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
        [self.window.rootViewController presentViewController:nav animated:YES completion:nil];
    }

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   //app已经进入后台时 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LOGIN" object:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    //app已经进入激活状态是 注册通知
    [self registNotification];
    
    [self setLoginView];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
