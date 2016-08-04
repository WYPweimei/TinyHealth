//
//  NSObject_Tools.m
//  DaBaiCai
//
//  Created by 王烨谱 on 16/6/21.
//  Copyright © 2016年 大白菜. All rights reserved.
//

#import "NSObject_Tools.h"
#import "SFHFKeychainUtils.h"

@implementation NSObject_Tools


+(NSString *)getSystemDeviceUUID{
    NSString *SERVICE_NAME=@"saveDeviceUUID";
    //取密码
    NSString *passWord;
    passWord =  [SFHFKeychainUtils getPasswordForUsername:@"userDeviceUUID"
                                           andServiceName:SERVICE_NAME
                                                    error:nil];
    NSLog(@"%@",passWord);
    if (passWord == nil || passWord.length == 0) {
        //存密码
        NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
        [SFHFKeychainUtils storeUsername:@"userDeviceUUID"
                             andPassword:identifierForVendor
                          forServiceName:SERVICE_NAME
                          updateExisting:1
                                   error:nil];
        passWord =  [SFHFKeychainUtils getPasswordForUsername:@"userDeviceUUID"
                                               andServiceName:SERVICE_NAME
                                                        error:nil];
    }
    NSLog(@"%@",passWord);
    return passWord;
}

+(NSString *)appVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    return app_Version;
}
@end
