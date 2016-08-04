//
//  HomeViewController.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/11.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeSettingView.h"//首页下拉刷新出现的推广试图
#import "HomeScollManage.h"//首页滑动控制管理
#import "HomeTableView.h"

static NSString *const HomeSettingViewNibName = @"HomeSettingView";

@interface HomeViewController ()<HomeTableViewScrollDelegate>

@property (weak, nonatomic) IBOutlet HomeTableView *tableView;
@property (nonatomic, strong)HomeSettingView *settingView;//推荐试图

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark ----------------------UI---------------------
    /**
     *  配置XIB
     */
    [self configXib];
    /**
     *  添加推荐试图
     */
    [self.view addSubview:self.settingView];
    [self.view insertSubview:self.tableView aboveSubview:self.settingView];
    
#pragma mark ----------------------DO---------------------
    /**
     *  请求网络数据
     */
    [self requstData];
    /**
     *  刷新tableview数据
     */
    [self beginRefresh];
}


#pragma mark ----------------------配置XIB界面----------------------
-(void)configXib{
    _tableView.homeTableDelegate = self;
}


#pragma Mark ----------------------请求网络数据----------------------
-(void)requstData{
    
}


#pragma mark ----------------------开始刷新数据----------------------
-(void)beginRefresh{

}


#pragma mark --------------------创建首页下拉显示的试图------------------------
-(HomeSettingView *)settingView{
    if (_settingView == nil) {
        _settingView = [[NSBundle mainBundle]loadNibNamed:HomeSettingViewNibName owner:self options:nil].lastObject;
        _settingView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
    }
    return _settingView;
}


#pragma mark - ------------------HomeTableViewScrollDelegate------------------
//scrolling
- (void)homeTableViewScrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffSizeY = scrollView.contentOffset.y;
      [[HomeScollManage shareScollManage]scrollingWithSuperView:self.view tableView:self.tableView recommendView:self.settingView contentOffSizeY:contentOffSizeY];
}

//WillBeginScroll
- (void)homeTableViewScrollViewWillBeginDragging:(UIScrollView *)scrollView{
    CGFloat contentOffSizeY = scrollView.contentOffset.y;
    [[HomeScollManage shareScollManage]scrollWillBeginWithSuperView:self.view tableView:self.tableView recommendView:self.settingView contentOffSizeY:contentOffSizeY];

}

//willEndScroll
- (void)homeTableViewScrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat contentOffSizeY = scrollView.contentOffset.y;
    [[HomeScollManage shareScollManage]scrollWillEndWithSuperView:self.view tableView:self.tableView recommendView:self.settingView contentOffSizeY:contentOffSizeY];
}
//*********************END*********************


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%@被销毁了", self);

}

@end
