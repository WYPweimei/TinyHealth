//
//  HomeDrawQuotationView.m
//  TinyHealth
//
//  Created by 王烨谱 on 16/7/12.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import "HomeDrawQuotationView.h"

static CGFloat lineWidth = 1.0f;//线的宽度
static CGFloat lineHorizontalGap = 10.0f;//线与线之间水平距离
static CGFloat lineVerticalGap = 10.0f;//线与线之间垂直距离
static CGFloat lineHeight = 100.0f;//线的高度
static NSInteger lineHorizontalRow = 10;//水平线的条数
static NSInteger lineVerticalRow = 10;//垂直线的条数


@implementation HomeDrawQuotationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self drowLine];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

#pragma mark 画线条
//-(void)drowLine{
//    
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
////    [shapeLayer setBounds:self.bounds];
////    [shapeLayer setPosition:self.center];
//    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
//    // 设置虚线颜色为blackColor [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
//    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
//    // 3.0f设置虚线的宽度
//    [shapeLayer setLineWidth:lineWidth];
//    [shapeLayer setLineJoin:kCALineJoinRound];
//    // 3=线的宽度 1=每条线的间距
////    [shapeLayer setLineDashPattern:
////     [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
////      [NSNumber numberWithInt:1],nil]];
//    // Setup the path
//    CGMutablePathRef path = CGPathCreateMutable();
//    //画水平方向的线条
//    for (int i = 0; i < lineHorizontalRow; i ++) {
//        CGFloat X =
//    }
//    
//    //画垂直方向的线条
//    for (int i = 0; i < lineHorizontalRow; i ++) {
//        
//    }
//    CGPathMoveToPoint(path, NULL, 10, 89);
//    CGPathAddLineToPoint(path, NULL, 320,89);
//    // 320,10代表初始坐标的x，y
//    CGPathMoveToPoint(path, NULL, 0, 0);
//    CGPathAddLineToPoint(path, NULL, 320,10);
//    
//    [shapeLayer setPath:path];
//    
//    CGPathRelease(path);
//    
//    [self.layer addSublayer:shapeLayer];
//    
//}
@end
