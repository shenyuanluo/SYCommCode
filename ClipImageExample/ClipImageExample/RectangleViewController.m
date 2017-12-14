//
//  RectangleViewController.m
//  ClipImageExample
//
//  Created by shenyuanluo on 2017/12/13.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "RectangleViewController.h"
#import "ClipImage.h"

@interface RectangleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UIImageView *tlImageView;
@property (weak, nonatomic) IBOutlet UIImageView *tcImageView;
@property (weak, nonatomic) IBOutlet UIImageView *trImageView;
@property (weak, nonatomic) IBOutlet UIImageView *clImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ccImageView;
@property (weak, nonatomic) IBOutlet UIImageView *crImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bcImageView;
@property (weak, nonatomic) IBOutlet UIImageView *brImageView;

@end

@implementation RectangleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"矩形裁剪";
    
    [self configImageView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)configImageView
{
    UIImage *bigImage = [UIImage imageNamed:@"portrait.png"];
    self.bigImageView.image  = bigImage;
    CGFloat sImgWidth  = bigImage.size.width * 0.3333f;
    CGFloat sImgHeight = bigImage.size.height * 0.3333f;
    
    CGRect tlFrame = CGRectMake(0 * sImgWidth, 0 * sImgHeight, sImgWidth, sImgHeight);
    CGRect tcFrame = CGRectMake(1 * sImgWidth, 0 * sImgHeight, sImgWidth, sImgHeight);
    CGRect trFrame = CGRectMake(2 * sImgWidth, 0 * sImgHeight, sImgWidth, sImgHeight);
    
    CGRect clFrame = CGRectMake(0 * sImgWidth, 1 * sImgHeight, sImgWidth, sImgHeight);
    CGRect ccFrame = CGRectMake(1 * sImgWidth, 1 * sImgHeight, sImgWidth, sImgHeight);
    CGRect crFrame = CGRectMake(2 * sImgWidth, 1 * sImgHeight, sImgWidth, sImgHeight);
    
    CGRect blFrame = CGRectMake(0 * sImgWidth, 2 * sImgHeight, sImgWidth, sImgHeight);
    CGRect bcFrame = CGRectMake(1 * sImgWidth, 2 * sImgHeight, sImgWidth, sImgHeight);
    CGRect brFrame = CGRectMake(2 * sImgWidth, 2 * sImgHeight, sImgWidth, sImgHeight);
    
    self.tlImageView.image = [ClipImage rectangleImage:bigImage toRect:tlFrame];
    self.tcImageView.image = [ClipImage rectangleImage:bigImage toRect:tcFrame];
    self.trImageView.image = [ClipImage rectangleImage:bigImage toRect:trFrame];
    self.clImageView.image = [ClipImage rectangleImage:bigImage toRect:clFrame];
    self.ccImageView.image = [ClipImage rectangleImage:bigImage toRect:ccFrame];
    self.crImageView.image = [ClipImage rectangleImage:bigImage toRect:crFrame];
    self.blImageView.image = [ClipImage rectangleImage:bigImage toRect:blFrame];
    self.bcImageView.image = [ClipImage rectangleImage:bigImage toRect:bcFrame];
    self.brImageView.image = [ClipImage rectangleImage:bigImage toRect:brFrame];
}

@end
