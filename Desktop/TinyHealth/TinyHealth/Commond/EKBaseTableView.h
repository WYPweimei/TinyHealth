//
//  EKBaseTableView.h
//  EkuAPP
//
//  Created by sfwan on 16/1/13.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EKBaseTableView : UITableView

@property (nonatomic, copy) RefreshDataBlock refreshBlock;
@property (nonatomic, copy) LoadMoreDataBlock loadMoreBlock;
//@property (nonatomic, copy) ReloadBlock reloadBlock;

/**
 *  移除加载更多
 */
- (void)removeLoadMore;
/**
 *  结束下拉刷新状态
 */
-(void)endRefresh;
/**
 *  结束上拉加载更多状态
 */
-(void)endLoadMore;
/**
 *  开始下拉刷新
 */
-(void)beginRefreshing;
/**
 *  开始上拉加载
 */
-(void)beginLoadingMore;

/**
 *  设置首页刷新状态
 */
-(void)setHomeRefresh;




@end
