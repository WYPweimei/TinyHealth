//
//  HomeItemModel.h
//  TinyHealth
//
//  Created by 王烨谱 on 16/8/1.
//  Copyright © 2016年 TinyHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeItemModel : NSObject

@property (nonatomic, strong) NSString *name; // 名称
@property (nonatomic, strong) NSString *icon; // 图标
@property (nonatomic, assign) NSInteger type; // 类型 0 为大品种, 1 为二级, 2为三级, 3为四级
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) id specifications; // 规格
@property (nonatomic, strong) NSString *categery; // 类别


@end
