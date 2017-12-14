//
//  MasonryAutoHeightViewController.m
//  AutoCellHeightExample
//
//  Created by shenyuanluo on 2017/12/11.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "MasonryAutoHeightViewController.h"
#import "MasonryListTableViewCell.h"

static NSString * const kMasonryCellId = @"masonryCellId";

@interface MasonryAutoHeightViewController () <
                                                UITableViewDelegate,
                                                UITableViewDataSource
                                              >
@property (weak, nonatomic) IBOutlet UITableView *masonryTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MasonryAutoHeightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Masonry 布局";
    
    [self configTableView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self reqData];
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)configTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.masonryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MasonryListTableViewCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:kMasonryCellId];
    self.masonryTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.masonryTableView.backgroundColor = BG_COLOR;
}


- (void)reqData
{
    NSString *string = @"歌曲名:初恋情人  歌手:刘小慧  专辑:宝丽金真开心精选 1  刘小慧 - 初恋情人  作词：简宁  作曲：陈进兴/黄一雄  当你要走的某天 请不必慰问  常道初恋终必分手总会变心  当你要走的某天 也不必抱憾  让我他朝好好追忆那需遗憾  爱 永远有些缺憾  不必找出那原因  爱 永远有些悔恨  可知相识也是缘份  何妨让我倚靠在你身边  缠绵梦里 痴心永远  明晨若要分手带走伤感  无谓让这初恋留恨  何妨让你倚靠在我的心  柔情热爱 痴心永远  明晨若要分手带走伤感  祈求莫要别离我心";
    
    // 假数据
    for (int i = 0; i < 100; i++)
    {
        ListCellDataModel *model = [[ListCellDataModel alloc] init];
        NSInteger index          = (arc4random()%(string.length / 20)) * 20;
        model.nickName           = @"ShenYuanLuo";
        model.publishTime        = @"2017-12-11 22:32:38";
        model.desc               = [string substringToIndex:MAX(20, index)];
        model.likeCount          = @"50万";
        model.commentCount       = @"2.5万";
        model.shareCount         = @"4万";
        
        [self.dataArray addObject:model];
    }
    [self.masonryTableView reloadData];
}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MasonryListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMasonryCellId
                                                                     forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.listCellData   = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - Getters
- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
