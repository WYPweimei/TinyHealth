//
//  HomeRecommendView.h
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/12.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//
#pragma mark -------------首页下拉显示的试图-----------------

#import <UIKit/UIKit.h>

@interface HomeSettingView : UIView

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

-(void)showWithSuperView:(UIView *)superView;


@end
