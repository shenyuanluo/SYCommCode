//
//  NetworkState.h
//  NetworkStateExample
//
//  Created by shenyuanluo on 2017/12/7.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import <UIKit/UIKit.h>

/** 网络状态枚举 */
typedef NS_ENUM(NSUInteger, SYNetworkState) {
    SYNetwork_Unknow        = 0x00,         // 未知
    SYNetwork_No            = 0x01,         // 无网络
    SYNetwork_2G            = 0x02,         // 2G 网络
    SYNetwork_3G            = 0x03,         // 3G 网络
    SYNetwork_4G            = 0x04,         // 4G 网络
    SYNetwork_WiFi          = 0x05,         // WiFi 网络
};

@interface NetworkState : NSObject

/**
 判断网络状态
 
 @return 网络状态，参见‘SYNetworkState’
 */
+ (SYNetworkState)syNetworkState;

@end
