//
//  EKBaseTableView.m
//  EkuAPP
//
//  Created by sfwan on 16/1/13.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "EKBaseTableView.h"
#import "MJRefresh.h"


@interface EKBaseTableView()
{
    MJRefreshNormalHeader *header;
    MJRefreshBackNormalFooter *footer;
}
@end


@implementation EKBaseTableView

-(void)awakeFromNib{
    [super awakeFromNib];
//    UIView *footerView = [[UIView alloc]init];
//    self.tableFooterView = footerView;
}

-(void)setLoadMoreBlock:(LoadMoreDataBlock)loadMoreBlock{
    _loadMoreBlock = loadMoreBlock;
    
    [self addFooter];
}

-(void)setRefreshBlock:(RefreshDataBlock)refreshBlock{
    _refreshBlock = refreshBlock;
    [self addHeader];
}


#pragma mark 添加下拉刷新部件
- (void)addHeader
{
    __weak EKBaseTableView *this = self;
    header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [this.mj_header endRefreshing];
            if (this.refreshBlock) {
                this.refreshBlock();
            }
        });
    }];
    // 隐藏时间
//    header.arrowView.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.font = [UIFont systemFontOfSize:14];
    //    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    // 设置颜色
    header.stateLabel.textColor = [UIColor lightGrayColor];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    // 设置header
    self.mj_header = header;
}


#pragma mark  添加上拉加载部件
- (void)addFooter
{
    __weak EKBaseTableView *this = self;
    // 上拉刷新
    footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [this.mj_footer endRefreshing];
            if (this.loadMoreBlock) {
                this.loadMoreBlock();
            }
        });
    }];
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    //    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    // 设置颜色
    footer.stateLabel.textColor = [UIColor lightGrayColor];
    self.mj_footer = footer;
}

#pragma mark 移除加载更多
- (void)removeLoadMore{
    _loadMoreBlock = nil;
    [self.mj_footer endRefreshing];
}


#pragma mark  结束下拉刷新状态
-(void)endRefresh{
    // 结束头部刷新
    [self.mj_header endRefreshing];
}



#pragma mark  结束上拉加载更多状态
-(void)endLoadMore{
    [self.mj_footer endRefreshing];
}


#pragma mark  开始下拉刷新
-(void)beginRefreshing{
    [self.mj_header endRefreshing];
}


#pragma mark  开始上拉加载
-(void)beginLoadingMore{
    [self.mj_footer beginRefreshing];
}




#pragma mark - ------------------设置不同页面的刷新状态---------------------
#pragma mark  设置首页刷新状态
-(void)setHomeRefresh{
    [header setTitle:KRefreshDownShowTitle forState:MJRefreshStateIdle];
    [header setTitle:KRefreshDownShowTitle forState:MJRefreshStatePulling];
    [header setTitle:KRefreshDownShowTitle forState:MJRefreshStateRefreshing];
}

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
@end
