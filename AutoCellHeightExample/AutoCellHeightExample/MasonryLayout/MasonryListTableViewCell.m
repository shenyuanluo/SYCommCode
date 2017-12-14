//
//  MasonryListTableViewCell.m
//  AutoCellHeightExample
//
//  Created by shenyuanluo on 2017/12/11.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "MasonryListTableViewCell.h"
#import "UILabel+LineSpacing.h"
#import "Masonry.h"
#import "ClipImage.h"


@interface MasonryListTableViewCell()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *followButton;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *separatorView;

@end

@implementation MasonryListTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addSubviews];
    [self configUI];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


- (void)addSubviews
{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nickNameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.closeButton];
    [self.contentView addSubview:self.followButton];
    [self.contentView addSubview:self.likeButton];
    [self.contentView addSubview:self.commentButton];
    [self.contentView addSubview:self.shareButton];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.separatorView];
}


- (void)configUI
{
    __weak typeof(self)weakSelf = self;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.contentView.mas_left).mas_offset(MARGIN);
        make.top.mas_equalTo(strongSelf.contentView.mas_top).mas_offset(MARGIN);
        make.width.mas_equalTo(40.0f);
        make.height.mas_equalTo(strongSelf.iconImageView.mas_width);
        
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.iconImageView.mas_right).mas_offset(MARGIN);
        make.top.mas_equalTo(strongSelf.iconImageView.mas_top);
        make.height.mas_equalTo(20.0f);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.nickNameLabel.mas_left);
        make.top.mas_equalTo(strongSelf.nickNameLabel.mas_bottom);
        make.height.mas_equalTo(20.0f);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.right.mas_equalTo(strongSelf.contentView.mas_right).mas_offset(-MARGIN);
        make.top.mas_equalTo(strongSelf.iconImageView.mas_top);
        make.width.mas_equalTo(20.0f);
        make.height.mas_equalTo(strongSelf.closeButton.mas_width).multipliedBy(0.75);
    }];
    
    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.right.mas_equalTo(strongSelf.closeButton.mas_left).mas_offset(-MARGIN);
        make.centerY.mas_equalTo(strongSelf.closeButton.mas_centerY);
        make.width.mas_offset(40.0f);
        make.height.mas_offset(20.0f);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.contentView.mas_left).mas_offset(MARGIN);
        make.top.mas_equalTo(strongSelf.iconImageView.mas_bottom).mas_offset(MARGIN);
        make.right.mas_equalTo(strongSelf.contentView.mas_right).mas_offset(-MARGIN);
        make.bottom.mas_equalTo(strongSelf.contentView.mas_bottom).mas_offset(-40.0f);
    }];
    
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.centerX.mas_equalTo(strongSelf.contentView.mas_centerX);
        make.top.mas_equalTo(strongSelf.descLabel.mas_bottom).mas_offset(5.0f);
        make.width.mas_equalTo(strongSelf.contentView.mas_width).multipliedBy(0.3333f).mas_offset(-12.0f);
        make.bottom.mas_equalTo(strongSelf.contentView.mas_bottom).mas_offset(-5.0f);
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.right.mas_equalTo(strongSelf.commentButton.mas_left);
        make.centerY.mas_equalTo(strongSelf.commentButton.mas_centerY);
        make.width.mas_equalTo(strongSelf.commentButton.mas_width);
        make.height.mas_equalTo(strongSelf.commentButton.mas_height);
    }];
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.commentButton.mas_right);
        make.centerY.mas_equalTo(strongSelf.commentButton.mas_centerY);
        make.width.mas_equalTo(strongSelf.commentButton.mas_width);
        make.height.mas_equalTo(strongSelf.commentButton.mas_height);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.mas_left);
        make.right.mas_equalTo(strongSelf.mas_right);
        make.bottom.mas_equalTo(strongSelf.commentButton.mas_top);
        make.height.mas_equalTo(0.5f);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!strongSelf)
        {
            return ;
        }
        make.left.mas_equalTo(strongSelf.mas_left);
        make.right.mas_equalTo(strongSelf.mas_right);
        make.bottom.mas_equalTo(strongSelf.mas_bottom);
        make.height.mas_equalTo(4.0f);
    }];
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


#pragma mark - Getter
- (UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [ClipImage circleImage:[UIImage imageNamed:@"portrait"]
                                                width:2
                                                color:[UIColor orangeColor]
                                            isOverlap:YES];
    }
    return _iconImageView;
}


- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel)
    {
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        _nickNameLabel.textColor = [UIColor blackColor];
    }
    return _nickNameLabel;
}


- (UILabel *)timeLabel
{
    if (!_timeLabel)
    {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:14.0f];
        _timeLabel.textColor = [UIColor lightGrayColor];
    }
    return _timeLabel;
}


- (UILabel *)descLabel
{
    if (!_descLabel)
    {
        _descLabel = [[UILabel alloc] init];
        _descLabel.numberOfLines = 0;
        _descLabel.font = [UIFont systemFontOfSize:14.0f];
        _descLabel.textColor = [UIColor blackColor];
    }
    return _descLabel;
}


- (UIButton *)closeButton
{
    if (!_closeButton)
    {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"close"]
                      forState:UIControlStateNormal];
    }
    return _closeButton;
}


- (UIButton *)followButton
{
    if (!_followButton)
    {
        _followButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _followButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_followButton setTitle:@"关注"
                       forState:UIControlStateNormal];
        [_followButton setTitleColor:[UIColor redColor]
                            forState:UIControlStateNormal];
    }
    return _followButton;
}


- (UIButton *)likeButton
{
    if (!_likeButton)
    {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _likeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
        [_likeButton setImage:[UIImage imageNamed:@"like"]
                     forState:UIControlStateNormal];
        [_likeButton setTitleColor:[UIColor darkGrayColor]
                          forState:UIControlStateNormal];
    }
    return _likeButton;
}


- (UIButton *)commentButton
{
    if (!_commentButton)
    {
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _commentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
        [_commentButton setImage:[UIImage imageNamed:@"comment"]
                        forState:UIControlStateNormal];
        [_commentButton setTitleColor:[UIColor darkGrayColor]
                             forState:UIControlStateNormal];
    }
    return _commentButton;
}


- (UIButton *)shareButton
{
    if (!_shareButton)
    {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _shareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
        [_shareButton setImage:[UIImage imageNamed:@"share"]
                      forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor darkGrayColor]
                           forState:UIControlStateNormal];
    }
    return _shareButton;
}


- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = LINE_COLOR;
    }
    return _lineView;
}


- (UIView *)separatorView
{
    if (!_separatorView)
    {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = BG_COLOR;
    }
    return _separatorView;
}


@end
