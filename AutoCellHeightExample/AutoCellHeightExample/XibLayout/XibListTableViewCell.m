//
//  XibListTableViewCell.m
//  AutoCellHeightExample
//
//  Created by shenyuanluo on 2017/12/11.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "XibListTableViewCell.h"
#import "UILabel+LineSpacing.h"
#import "ClipImage.h"

@interface XibListTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *followButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *separatorView;

@end

@implementation XibListTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self configUI];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


- (void)configUI
{
    self.lineView.backgroundColor      = LINE_COLOR;
    self.separatorView.backgroundColor = BG_COLOR;
    
    self.likeButton.titleEdgeInsets    = UIEdgeInsetsMake(0, 14, 0, 0);
    self.commentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
    self.shareButton.titleEdgeInsets   = UIEdgeInsetsMake(0, 14, 0, 0);
    
    self.iconImageView.image = [ClipImage circleImage:[UIImage imageNamed:@"portrait"]
                                                width:2
                                                color:[UIColor yellowColor]
                                            isOverlap:YES];
}


- (void)setListCellData:(ListCellDataModel *)listCellData
{
    _listCellData = listCellData;
    
    self.nickNameLabel.text      = listCellData.nickName;
    self.timeLabel.text          = listCellData.publishTime;
    self.descLabel.paragraphText = listCellData.desc;
    
    [self.likeButton setTitle:listCellData.likeCount
                     forState:UIControlStateNormal];
    [self.commentButton setTitle:listCellData.commentCount
                        forState:UIControlStateNormal];
    [self.shareButton setTitle:listCellData.shareCount
                      forState:UIControlStateNormal];
}

@end
