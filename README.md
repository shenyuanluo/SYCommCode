# SYCommCode
> 记录 `iOS` 常用代码片段。

## 判断当前网络状态 [Demo]()
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

## 屏幕亮度渐变 [Demo]()
1. 在 `didFinishLaunchingWithOptions:` 保存默认亮度值。

	```Objective-C
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO]
                                              forKey:IS_NEED_CHANGE_BRIGHTNESS];
    [GradualBrightness sySaveDefaultBrightness];
	```
2. 在 `applicationWillResignActive:` 恢复默认亮度值（如果需要）。

	```Objective-C
	NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    BOOL isNeedChangeBrightness = [[userDefault objectForKey:IS_NEED_CHANGE_BRIGHTNESS] boolValue];
    if (YES == isNeedChangeBrightness)
    {
        [GradualBrightness syResumeBrightness];
    }
	```
3. 在 `applicationDidBecomeActive:` 设定新亮度值（如果需要）。

	```Objective-C
	NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    BOOL isNeedChangeBrightness = [[userDefault objectForKey:IS_NEED_CHANGE_BRIGHTNESS] boolValue];
    if (YES == isNeedChangeBrightness)
    {
        [GradualBrightness syConfigBrightness:CUSTOM_BRIGHTNESS_VAULE];
    }
	```
4. 在 `viewWillAppear:` 设定新亮度值（同时设为需要）。
	
	```Objective-C
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES]
                                              forKey:IS_NEED_CHANGE_BRIGHTNESS];
    [GradualBrightness syConfigBrightness:CUSTOM_BRIGHTNESS_VAULE];
	```
5. 在 `viewWillDisappear:` 恢复默认亮度值（同时设为不需要）。

	```Objective-C
	[GradualBrightness syResumeBrightness];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO]
                                              forKey:IS_NEED_CHANGE_BRIGHTNESS];
	```
6. 实现代码

	``` Objective-C
	/** 亮度变换步幅 */
	#define GRADUAL_STRIDE  0.005f
	
	static CGFloat defaultBrightness;
	static NSOperationQueue *changeBrightnessQueue;
	

	#pragma mark -- 保存默认亮度值
	+ (void)sySaveDefaultBrightness
	{
	    defaultBrightness = [UIScreen mainScreen].brightness;
	}
	
	
	#pragma mark -- 逐步设置亮度
	+ (void)syConfigBrightness:(CGFloat)value
	{
	    if (!changeBrightnessQueue)
	    {
	        changeBrightnessQueue = [[NSOperationQueue alloc] init];
	        changeBrightnessQueue.maxConcurrentOperationCount = 1;
	    }
	    [changeBrightnessQueue cancelAllOperations];
	    
	    CGFloat brightness = [UIScreen mainScreen].brightness;
	    CGFloat stride = GRADUAL_STRIDE * ((value > brightness) ? 1 : -1);
	    NSInteger times = fabs((value - brightness) / GRADUAL_STRIDE);
	    for (NSInteger i = 1; i <= times; i++)
	    {
	        [changeBrightnessQueue addOperationWithBlock:^{
	            
	            [NSThread sleepForTimeInterval:1 / 180.0];
	            [UIScreen mainScreen].brightness = brightness + i * stride;
	        }];
	    }
	}
	
	
	#pragma mark -- 逐步恢复亮度
	+ (void)syResumeBrightness
	{
	    [self syConfigBrightness:defaultBrightness];
	}
	```