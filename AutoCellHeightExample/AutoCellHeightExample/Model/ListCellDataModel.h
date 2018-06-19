//
//  ListCellDataModel.h
//  AutoCellHeightExample
//
//  Created by shenyuanluo on 2017/12/11.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCellDataModel : NSObject

@property (nonatomic, copy) UIImage *icon;          // 头像
@property (nonatomic, copy) NSString *nickName;     // 昵称
@property (nonatomic, copy) NSString *publishTime;  // 发布时间
@property (nonatomic, copy) NSString *desc;         // 内容详情
@property (nonatomic, copy) NSString *likeCount;    // 赞数量
@property (nonatomic, copy) NSString *commentCount; // 评论数量
@property (nonatomic, copy) NSString *shareCount;   // 分享数量

@end
