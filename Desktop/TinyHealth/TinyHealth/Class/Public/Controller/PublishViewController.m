//
//  PublishViewController.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/8.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "PublishViewController.h"
#import "HomeDrawQuotationView.h"

@interface PublishViewController ()

@end

@implementation PublishViewController

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
