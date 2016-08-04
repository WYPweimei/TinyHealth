//
//  HomeScollManage.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/29.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "HomeScollManage.h"
#import "HomeSettingView.h"

static CGFloat scollBiggestContentOffY = 120;//下拉到这个值显示推荐试图

@interface HomeScollManage()
{
    BOOL isScrollTop;
    CGFloat _oldY;
}

@end
@implementation HomeScollManage

+(instancetype)shareScollManage{
    static HomeScollManage *scollManage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scollManage = [[HomeScollManage alloc]init];
    });
    return scollManage;
}

-(void)scrollWillBeginWithSuperView:(UIView *)superView
                      tableView:(UITableView *)tableView
                  recommendView:(HomeSettingView *)recommendView
                contentOffSizeY:(CGFloat)contentOffSizeY{
    _oldY = tableView.contentOffset.y;
    [self changePositionWithView:recommendView.collectionView anchorPoint:CGPointMake(0.5, 0)];
    if (contentOffSizeY >= 0) {
        isScrollTop = YES;
        [UIView transitionWithView:tableView duration:.7f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            tableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 49);
        } completion:^(BOOL finished) {
        }];
    }else{
        isScrollTop = NO;
    }
}



-(void)scrollWillEndWithSuperView:(UIView *)superView
                        tableView:(UITableView *)tableView
                    recommendView:(HomeSettingView *)recommendView
                  contentOffSizeY:(CGFloat)contentOffSizeY{
    //下拉超过120 显示推荐按钮
    if (contentOffSizeY < 0 && contentOffSizeY < -scollBiggestContentOffY) {

        tableView.frame = CGRectMake(0, 64 + KHomeCollectionViewHeight, kScreenWidth, kScreenHeight - 64 - 49);
    }else{
//        tableView.contentOffset = CGPointMake(0, 0);
        return;
    }
}


-(void)scrollingWithSuperView:(UIView *)superView
                    tableView:(UITableView *)tableView
                recommendView:(HomeSettingView *)recommendView
              contentOffSizeY:(CGFloat)contentOffSizeY{
    EKNSLog(@"%lf",contentOffSizeY);
    if (tableView.contentOffset.y > _oldY) {
        // 上滑
    }
    else{
        // 下滑
    }
    CGFloat opacity = 1 - fabs(contentOffSizeY)/scollBiggestContentOffY;
    //改变tableview展示
//    CGFloat transform = fabs(contentOffSizeY)/KHomeCollectionViewHeight;
    tableView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:opacity];
//    recommendView.collectionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:fabs(opacity - 1)];
    //改变recommendView的展示
    if (fabs(contentOffSizeY) <=  KHomeCollectionViewHeight) {
//        recommendView.collectionView.transform = CGAffineTransformScale(CGAffineTransformIdentity, transform, transform);
    }
}

/**
 *  改变试图动画锚点
 *
 *  @param view        要求改变的试图
 *  @param anchorPoint 新的锚点（0.5 ， 0 ）标识 顶部中间点
 */
-(void)changePositionWithView:(UIView *)view anchorPoint :(CGPoint)anchorPoint{
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height *anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}
@end
