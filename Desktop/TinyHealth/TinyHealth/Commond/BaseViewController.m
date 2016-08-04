//
//  HomeViewController.h
//  DaBaiCai
//
//  Created by 王烨谱 on 16/5/10.
//  Copyright © 2016年 大白菜. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()< UIScrollViewDelegate,UIAlertViewDelegate>
{
    UIView *navBar;
    UIButton *navLeftBtn;
    
    BOOL _didViewDisappear;
    
    iToast *_itoast;
}

@end

@implementation BaseViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _didViewDisappear = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _didViewDisappear = YES;
    [_itoast removeToast:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    /**
     *  配置Tabbar2级页面隐藏
     */
    [self config];
    /**
       初始化导航栏
     */
    [self _initNavBar];

}

#pragma mark 配置2级页面隐藏
-(void)config{
    //获取导航控制器的子控制器个数
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.autoresizesSubviews = NO;
}


#pragma mark创建共有的导航控制器
/**
 *  创建共有的导航控制器
 */
-(void)_initNavBar{
    
    [self.view addSubview:self.navigationbarView];
    [self.navigationbarView addSubview:self.leftButton];
    [self.navigationbarView addSubview:self.titleLabel];
    [self.navigationbarView addSubview:self.rightButton];
}


#pragma mark左侧返回按钮执行方法
/**
 *  自定义导航上面返回按钮执行方法
 *
 *  @param button 返回按钮
 */
- (void)leftButtonAction:(UIButton *)button {
    
    [self backAction];
}

-(void)backAction{
    //获取导航控制器的子控制器个数
    NSInteger count = self.navigationController.viewControllers.count;
    if (self.isModal) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else if (count > 2){
        /*//创建动画对象
         CATransition *pushAnimation = [[CATransition alloc] init];
         pushAnimation.duration = .3;
         pushAnimation.type = @"pageCurl";
         pushAnimation.subtype = kCATransitionFromLeft;
         //将动画效果添加到视图层
         [self.navigationController.view.layer addAnimation:pushAnimation forKey:nil];*/
        [self.navigationController popViewControllerAnimated:YES];
//        [tabbarController showOrHiddenTabbarView:YES];
    }else if (count <= 2){
        [self.navigationController popViewControllerAnimated:YES];
//        [tabbarController showOrHiddenTabbarView:NO];
        
    }
}

#pragma mark右侧返回按钮执行方法
/**
 *  自定义导航上面右侧按钮执行方法,复写这个方法可以执行每个页面不同的点击事件
 *
 *  @param button 右侧按钮
 */
- (void)rightButtonAction:(UIButton *)button {
    
}

-(void)showLoading:(NSString *)text{
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
//    UIView *view = self.view;
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:window animated:YES];
    HUD.color = HUDBackColor;
    //显示的文字
    HUD.labelText = text;
    //是否有庶罩
    HUD.dimBackground = YES;
}

-(void)hideLoading{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
//    UIView *view = self.view;
    [MBProgressHUD hideHUDForView:window animated:NO];
}


-(void)showNotice:(NSString *)msg{
    if (_didViewDisappear) {
        return;
    }
    _itoast = [iToast makeText:msg];
    [_itoast show];
}



#pragma mark -- getter
-(UIView *)navigationbarView{
    if (_navigationbarView == nil) {
        if (!IOS7){
            _navigationbarView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, kScreenWidth, 64)];
            _navigationbarView.tag = 10000;
            _navigationbarView.frame = CGRectMake(0, -20, kScreenWidth, 64);
        }else{
            _navigationbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
            _navigationbarView.frame = CGRectMake(0, 0, kScreenWidth, 64);
        }
        _navigationbarView.backgroundColor = [UIColor colorWithString:@"#f57f17"];
        _navigationbarView.userInteractionEnabled = YES;
    }
    return _navigationbarView;
}

-(UIButton *)leftButton{
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_leftButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14 ]];
        [_leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //获取导航控制器的子控制器个数
        NSInteger count = self.navigationController.viewControllers.count;
        if (self.isModal) {
            _leftButton.frame = CGRectMake(0, 20, 44, 44);
            [_leftButton setImage:[UIImage imageNamed:@"commond_back"] forState:UIControlStateNormal];
        } else if (count > 1){
            _leftButton.frame = CGRectMake(0, 20, 44, 44);
            [_leftButton setImage:[UIImage imageNamed:@"commond_back"] forState:UIControlStateNormal];
        }
    }
    return _leftButton;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, kScreenWidth - 100, 44)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}

-(UIButton *)rightButton{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 64, 20, 64, 44)];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
