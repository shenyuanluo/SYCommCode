//
//  ListCellDataModel.h
//  AutoCellHeightExample
//
//  Created by shenyuanluo on 2017/12/11.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCellDataModel : NSObject

@property (nonatomic, copy) UIImage *icon;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *publishTime;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *likeCount;
@property (nonatomic, copy) NSString *commentCount;
@property (nonatomic, copy) NSString *shareCount;

@end
