//
//  TinyConst.h
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/8.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

/**
 *  配置基本的常量属性
 *
 */
#ifndef TinyConst_h
#define TinyConst_h

#pragma mark ------------------------通用const-----------------------
/**
 hud背景颜色
 */
#define HUDBackColor [UIColor lightGrayColor]
/**
 主色调
 */
#define MainBackColor [UIColor colorWithRed:((0)/255.0) green:(255)/255.0 blue:(0)/255.0 alpha:0.2]

//icon 颜色
#define IconBackColor [UIColor colorWithString:@"#00FF00"]

#pragma mark ------------------------首页const-----------------------
//首页推荐试图一行展示个数
#define KRecommendLineCount 3
#define KRefreshDownShowTitle @"show微健康为我推荐"
#define KHomeCollectionViewHeight 60


#pragma mark ------------------------分享const-----------------------


#pragma mark ------------------------健康家const-----------------------


#pragma mark ------------------------个人资料const-----------------------



#pragma mark - ------------------block---------------------
//
typedef void (^RefreshDataBlock)(void);// 下拉刷新回调
typedef void (^LoadMoreDataBlock)(void);// 加载更多回调
//typedef void (^ReloadBlock)(void);// 重新加载


#endif /* TinyConst_h */
