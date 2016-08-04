//
//  HomeScollManage.h
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/29.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeSettingView;

@interface HomeScollManage : NSObject

+(instancetype)shareScollManage;
/**
 *  will begin scroll action -> init UIView
 *
 *  @param superView       homeviewcontroller.view
 *  @param tableView       homeviewcontroller.tableview
 *  @param recommendView   hmeviewcontroller.recommendview
 *  @param contentOffSizeY homeviewcontroller.tableview.contentoffsize.y
 */
-(void)scrollWillBeginWithSuperView:(UIView *)superView
                      tableView:(UITableView *)tableView
                  recommendView:(HomeSettingView *)recommendView
                contentOffSizeY:(CGFloat)contentOffSizeY;

//scroll will end -> finger leave the screen
-(void)scrollWillEndWithSuperView:(UIView *)superView
                      tableView:(UITableView *)tableView
                  recommendView:(HomeSettingView *)recommendView
                contentOffSizeY:(CGFloat)contentOffSizeY;


//scrolling -> scroll action is continuing
-(void)scrollingWithSuperView:(UIView *)superView
                        tableView:(UITableView *)tableView
                    recommendView:(HomeSettingView *)recommendView
                  contentOffSizeY:(CGFloat)contentOffSizeY;

//change view's anchorPoint
-(void)changePositionWithView:(UIView *)view anchorPoint :(CGPoint)anchorPoint;
@end

//@implementation NSObject (timerMange)
//
//- (void)contentTypeForImageData:(NSData *)data {
//    
//}
//@end