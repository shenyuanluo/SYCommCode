# 屏幕亮度渐变
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