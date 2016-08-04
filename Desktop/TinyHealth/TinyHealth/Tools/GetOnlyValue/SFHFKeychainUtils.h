//
//  SFHFKeychainUtils.h
//  DaBaiCai
//
//  Created by 王烨谱 on 16/6/21.
//  Copyright © 2016年 大白菜. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SFHFKeychainUtils : NSObject {
    
}

+ (NSString *) getPasswordForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;
+ (BOOL) storeUsername: (NSString *) username andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error;
+ (BOOL) deleteItemForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

@end
