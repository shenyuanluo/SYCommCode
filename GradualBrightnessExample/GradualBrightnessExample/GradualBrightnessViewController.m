//
//  GradualBrightnessViewController.m
//  GradualBrightnessExample
//
//  Created by shenyuanluo on 2017/12/7.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "GradualBrightnessViewController.h"

@interface GradualBrightnessViewController ()

@end

@implementation GradualBrightnessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"亮度渐变";
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES]
                                              forKey:IS_NEED_CHANGE_BRIGHTNESS];
    [GradualBrightness syConfigBrightness:CUSTOM_BRIGHTNESS_VAULE];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [GradualBrightness syResumeBrightness];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO]
                                              forKey:IS_NEED_CHANGE_BRIGHTNESS];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
