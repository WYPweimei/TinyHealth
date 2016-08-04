//
//  HomeRecommendView.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/12.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//


#import "HomeSettingView.h"
#import "HomeSettingCollectionViewCell.h"//推荐试图Cell

static NSString *const cellIdentify = @"HomeSettingCollectionViewCell";


@interface HomeSettingView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightCons;//collectionView的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewWidthCons;//collectionView的宽度

@end
@implementation HomeSettingView

-(void)awakeFromNib{
    [super awakeFromNib];
    /**
     *  配置XIB
     */
    [self configXib];
    
}

#pragma mark ----------------------配置XIB----------------------
-(void)configXib{
    //配置collectionView
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    _collectionView.collectionViewLayout = flowLayout;
    _collectionViewWidthCons.constant = KHomeCollectionViewHeight*KRecommendLineCount;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionViewHeightCons.constant = KHomeCollectionViewHeight;
    UINib *nib = [UINib nibWithNibName:cellIdentify bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:cellIdentify];
}


#pragma mark ------------------UICollectionViewDelegateFlowLayout------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize itmeSize = CGSizeMake(_collectionView.width/KRecommendLineCount, KHomeCollectionViewHeight);
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

#pragma mark ------------------UICollectionViewDataSource------------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeSettingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:cellIdentify owner:self options:nil].lastObject;
    }
    return cell;
}

-(void)showWithSuperView:(UIView *)superView{
    [superView insertSubview:self atIndex:superView.subviews.count +1];
}

@end
