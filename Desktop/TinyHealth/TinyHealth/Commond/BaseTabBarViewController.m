//
//  BaseTabbarViewController.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/8.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "PublishViewController.h"
#import "UserViewController.h"

@interface BaseTabBarViewController ()
{
    UIButton *centerButton;
}
@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
    [self configTabbar];

}


-(void)configTabbar{
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor colorWithString:@"#27e445"], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor greenColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -8, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
//    [imageView setImage:[UIImage imageNamed:@"tabbar_bg"]];
//    [imageView setContentMode:UIViewContentModeCenter];
//    [self.tabBar insertSubview:imageView atIndex:0];
//    //覆盖原生Tabbar的上横线
//    [[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
//    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
//    //设置TintColor
//    UITabBar.appearance.tintColor = [UIColor orangeColor];
    
}


//-(UIImage*) createImageWithColor:(UIColor*) color
//{
//    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return theImage;
//}


//设置中间按钮不受TintColor影响
- (void)awakeFromNib {
    [super awakeFromNib];
//    NSArray *items =  self.tabBar.items;
//    UITabBarItem *btnAdd = items[2];
//    btnAdd.image = [btnAdd.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    btnAdd.selectedImage = [btnAdd.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

#pragma mark -----------------------添加子控制器-----------------------
-(void)addChildViewControllers{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self addChildViewController:homeVC title:@"练习1" imageName:@"tabbar_message_center"];
    
    PublishViewController *publishVC = [[PublishViewController alloc]init];
    [self addChildViewController:publishVC title: nil imageName:@"tabbar_compose_icon_add"];
    //设置Item居中显示
    publishVC.tabBarItem.imageInsets=UIEdgeInsetsMake(4.5, 0,-4.5, 0);

    UserViewController *userVC = [[UserViewController alloc]init];
    [self addChildViewController:userVC title:@"练习2" imageName:@"tabbar_discover"];
}

/**
 *  添加子控制器
 */
-(void)addChildViewController: (BaseViewController *)ctrl
                            title:(NSString *)title
                        imageName:(NSString *)imageName{
    if (title) {
         ctrl.titleLabel.text = title;
         ctrl.tabBarItem.title = title;
    }
    ctrl.tabBarItem.image =[UIImage imageNamed:imageName];
    NSString *selectedImageName = [NSString stringWithFormat:@"%@%@",imageName,@"_highlighted"];
    ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CGRect rect = ctrl.tabBarItem.accessibilityFrame;
    ctrl.tabBarItem.accessibilityFrame = CGRectOffset(rect, 0, 100);
    [self addChildViewController:ctrl];
//    NSArray *items =  self.tabBar.items;
//    if (items.count == 1) {
//
//    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
