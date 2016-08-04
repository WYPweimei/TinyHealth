//
//  HomeTableView.h
//  TinyHealth
//
//  Created by 王烨谱 on 16/8/3.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "EKBaseTableView.h"

@protocol HomeTableViewScrollDelegate <NSObject>
//scrolling
- (void)homeTableViewScrollViewDidScroll:(UIScrollView *)scrollView;

//WillBeginScroll
- (void)homeTableViewScrollViewWillBeginDragging:(UIScrollView *)scrollView;

//willEndScroll
- (void)homeTableViewScrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
@end

@interface HomeTableView : EKBaseTableView

@property (nonatomic, assign) id<HomeTableViewScrollDelegate>homeTableDelegate;

@end
