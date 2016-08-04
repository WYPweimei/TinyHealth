//
//  HomeViewController.h
//  DaBaiCai
//
//  Created by 王烨谱 on 16/5/10.
//  Copyright © 2016年 大白菜. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTabBarViewController;
@interface BaseViewController : UIViewController

@property (strong, nonatomic) UIView *navigationbarView;
@property (strong, nonatomic) UIButton *leftButton;
@property (strong, nonatomic) UIButton *rightButton;
@property (assign, nonatomic) BOOL isModal;
@property (strong, nonatomic) UILabel *titleLabel;
@property(nonatomic, assign)BOOL isHomeVC;

@property (nonatomic, assign) BOOL hasBack;

/**
 *  返回POP DISMISS
 */
-(void)backAction;
/**
 *  提示正在加载
 *
 *  @param text 提示文本
 */
-(void)showLoading:(NSString *)text;
/**
 *  隐藏显示
 */
-(void)hideLoading;
/**
 *  提示框提醒（1秒）
 *
 *  @param msg 提示文本
 */
-(void)showNotice:(NSString *)msg;

@end
