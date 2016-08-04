//
//  TableHeaderView.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/8/4.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "TheTableHeaderView.h"
@interface TheTableHeaderView()<UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView *scrollView;

@end
@implementation TheTableHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self configXib];
}

-(void)configXib{
    self.backgroundColor = [UIColor greenColor];
    [self addSubview:self.scrollView];
}


-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.contentSize = CGSizeMake(kScreenWidth * 3, 0);
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

#pragma mark - ------------------HomeCollectionViewDelegate------------------
//scrolling
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

//WillBeginScroll
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}
//willEndScroll
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
   
}

@end
