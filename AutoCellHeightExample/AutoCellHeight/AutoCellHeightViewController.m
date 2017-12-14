//
//  AutoCellHeightViewController.m
//  AutoCellHeight
//
//  Created by shenyuanluo on 2017/12/11.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "AutoCellHeightViewController.h"

@interface AutoCellHeightViewController ()

/** 缓存 cell 高度*/
@property (nonatomic, strong) NSMutableDictionary *cellHeightBuff;

@end

@implementation AutoCellHeightViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [self.cellHeightBuff objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 100;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [NSNumber numberWithFloat:cell.frame.size.height];
    
    // 缓存 cell 高度
    [self.cellHeightBuff setObject:height
                            forKey:indexPath];
}


- (NSMutableDictionary *)cellHeightBuff
{
    if (!_cellHeightBuff)
    {
        _cellHeightBuff = [NSMutableDictionary dictionary];
    }
    return _cellHeightBuff;
}


@end
