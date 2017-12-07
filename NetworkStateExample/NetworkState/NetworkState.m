//
//  NetworkState.m
//  NetworkStateExample
//
//  Created by shenyuanluo on 2017/12/7.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "NetworkState.h"

@implementation NetworkState

#pragma mark -- 判断网络状态
+ (SYNetworkState)syNetworkState
{
    UIApplication *application = [UIApplication sharedApplication];
    NSArray *subViewArray;
    // iPhone X
    if ([[application valueForKeyPath:@"_statusBar"] isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")])
    {
        subViewArray = [[[[application valueForKeyPath:@"_statusBar"] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    }
    else    // 其他
    {
        subViewArray = [[[application valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    }
    
    int netType = 0;
    SYNetworkState netState = SYNetwork_Unknow;
    for (id subView in subViewArray)
    {
        if (![subView isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")])
        {
            continue;
        }
        netType = [[subView valueForKeyPath:@"dataNetworkType"] intValue];
    }
    switch (netType)
    {
        case 0:
            netState = SYNetwork_No;
            break;
            
        case 1:
            netState = SYNetwork_2G;
            break;
            
        case 2:
            netState = SYNetwork_3G;
            break;
            
        case 3:
            netState = SYNetwork_4G;
            break;
            
        case 5:
            netState = SYNetwork_WiFi;
            break;
            
        default:
            netState = SYNetwork_Unknow;
            break;
    }
    return netState;
}

@end
