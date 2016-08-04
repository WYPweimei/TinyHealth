//
//  HomeTableView.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/8/3.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeTableViewCell.h"
#import "HomeTableHeaderView.h"
#import "TheTableHeaderView.h"

static NSString *const tableHeaderViewNibName = @"TheTableHeaderView";
static NSString *const homeTableHeaderViewNibName = @"HomeTableHeaderView";
static NSString *const cellIdentify = @"HomeTableViewCell";

@interface HomeTableView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)HomeTableHeaderView *homeTableHeaderView;
@property(nonatomic, strong)TheTableHeaderView *theTableHeaderView;

@end
@implementation HomeTableView

-(HomeTableHeaderView *)homeTableHeaderView{
    if (_homeTableHeaderView == nil) {
        _homeTableHeaderView = [[NSBundle mainBundle]loadNibNamed:homeTableHeaderViewNibName owner:self options:nil].lastObject;
        _homeTableHeaderView.frame = CGRectMake(0, 0, kScreenWidth, 120);
    }
    return _homeTableHeaderView;
}

-(TheTableHeaderView *)theTableHeaderView{
    if (_theTableHeaderView == nil) {
        _theTableHeaderView = [[NSBundle mainBundle]loadNibNamed:tableHeaderViewNibName owner:self options:nil].lastObject;
        _theTableHeaderView.frame = CGRectMake(0, 0, kScreenWidth, 130);
    }
    return _theTableHeaderView;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    /**
     *  配置XIB
     */
    [self configXib];
    
//    self.tableHeaderView = self.homeTableHeaderView;
    self.tableHeaderView = self.theTableHeaderView;
}

#pragma mark ----------------------配置XIB界面----------------------
-(void)configXib{
    self.delegate = self;
    self.dataSource = self;
    UINib *topNib = [UINib nibWithNibName:cellIdentify bundle:nil];
    [self registerNib:topNib forCellReuseIdentifier:cellIdentify];
}


#pragma mark --------------UITableViewDelegate,UITableViewDataSource---------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:cellIdentify owner:self options:nil].lastObject;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSArray *array =  tableView.indexPathsForVisibleRows;
//    NSIndexPath *firstIndexPath = array[0];
//    //设置anchorPoint
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    //为了防止cell视图移动，重新把cell放回原来的位置
//    cell.layer.position = CGPointMake(0, cell.layer.position.y);
//    
//    
//    //设置cell 按照z轴旋转90度，注意是弧度
//    if (firstIndexPath.row < indexPath.row) {
//        cell.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1.0);
//    }else{
//        cell.layer.transform = CATransform3DMakeRotation(- M_PI_2, 0, 0, 1.0);
//    }
//    
//    
//    cell.alpha = 0.0;
//    
//    
//    [UIView animateWithDuration:1 animations:^{
//        cell.layer.transform = CATransform3DIdentity;
//        cell.alpha = 1.0;
//    }];
//}

#pragma mark - ------------------HomeCollectionViewDelegate------------------
//scrolling
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.homeTableDelegate respondsToSelector:@selector(homeTableViewScrollViewDidScroll:)]) {
        return [self.homeTableDelegate homeTableViewScrollViewDidScroll:scrollView];
    }
}

//WillBeginScroll
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if ([self.homeTableDelegate respondsToSelector:@selector(homeTableViewScrollViewWillBeginDragging:)]) {
        return [self.homeTableDelegate homeTableViewScrollViewWillBeginDragging:scrollView];
    }
}

//willEndScroll
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if ([self.homeTableDelegate respondsToSelector:@selector(homeTableViewScrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
        return [self.homeTableDelegate homeTableViewScrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}
//*********************END*********************
@end
