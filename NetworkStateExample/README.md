# 判断当前网络状态 
``` Objective-C
/** 网络状态枚举 */
typedef NS_ENUM(NSUInteger, SYNetworkState) {
    SYNetwork_Unknow        = 0x00,         // 未知
    SYNetwork_No            = 0x01,         // 无网络
    SYNetwork_2G            = 0x02,         // 2G 网络
    SYNetwork_3G            = 0x03,         // 3G 网络
    SYNetwork_4G            = 0x04,         // 4G 网络
    SYNetwork_WiFi          = 0x05,         // WiFi 网络
};


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
```