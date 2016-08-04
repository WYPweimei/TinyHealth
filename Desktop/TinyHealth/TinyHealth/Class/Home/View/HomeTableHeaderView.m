//
//  HomeTableHeaderView.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/8/3.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "HomeTableHeaderView.h"
#import "HomeTableHeaderCollectionViewCell.h"
#import "HomeScollManage.h"

static NSString *const cellIdentify = @"HomeTableHeaderCollectionViewCell";
@interface HomeTableHeaderView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    NSIndexPath *index;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HomeTableHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self configXib];
}

-(void)configXib{
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];//设置其布局方向
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.showsHorizontalScrollIndicator = NO;
    UINib *nib = [UINib nibWithNibName:cellIdentify bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:cellIdentify];
}

#pragma mark ------------------UICollectionViewDelegateFlowLayout------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize itmeSize = CGSizeMake(kScreenWidth - 16, _collectionView.height);
    return itmeSize;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    return insets;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    EKNSLog(@"点击了");
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.transform = CGAffineTransformMakeScale(0.4, 0.4);
    EKNSLog(@"%ld",indexPath.row);
    EKNSLog(@"%ld",index.row);
    cell.alpha = 0.0;
    [UIView animateWithDuration:0.7 animations:^{
        cell.transform = CGAffineTransformIdentity;
        cell.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark ------------------UICollectionViewDataSource------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    index = indexPath;
    cell.transform = CGAffineTransformMakeScale(1.2, 1.2);
    cell.backgroundColor = RandomColor;
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:cellIdentify owner:self options:nil].lastObject;
    }
    return cell;
}
@end
