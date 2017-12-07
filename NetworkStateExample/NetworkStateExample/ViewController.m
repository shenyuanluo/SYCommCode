//
//  ViewController.m
//  NetworkStateExample
//
//  Created by shenyuanluo on 2017/12/7.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "ViewController.h"
#import "NetworkState.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *netStateLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.netStateLabel.text = [NSString stringWithFormat:@"当前网络状态：%@", [self getNetworkState]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSString *)getNetworkState
{
    NSString *netStateStr;
    SYNetworkState netState = [NetworkState syNetworkState];
    switch (netState)
    {
        case SYNetwork_Unknow:
            netStateStr = @"未知";
            break;
            
        case SYNetwork_No:
            netStateStr = @"无网络";
            break;
            
        case SYNetwork_2G:
            netStateStr = @"2G 网络";
            break;
            
        case SYNetwork_3G:
            netStateStr = @"3G 网络";
            break;
            
        case SYNetwork_4G:
            netStateStr = @"4G 网络";
            break;
            
        case SYNetwork_WiFi:
            netStateStr = @"WiFi 网络";
            break;
            
        default:
            netStateStr = @"未知";
            break;
    }
    return netStateStr;
}


@end
