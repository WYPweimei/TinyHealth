//
//  GuideViewController.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/11.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  配置XIB
     */
    [self configXib];
    /**
     *  请求网络数据
     */
    [self requstData];
}

#pragma mark 配置XIB界面
-(void)configXib{
    
}

#pragma Mark 请求网络数据
-(void)requstData{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%@被销毁了", self);
    
}

@end
