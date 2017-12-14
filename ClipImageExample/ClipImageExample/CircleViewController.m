//
//  CircleViewController.m
//  ClipImageExample
//
//  Created by shenyuanluo on 2017/12/13.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "CircleViewController.h"
#import "ClipImage.h"

@interface CircleViewController ()
{
    BOOL _isOverlap;
}

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

@property (weak, nonatomic) IBOutlet UISwitch *changeOverlap;
@end

@implementation CircleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"圆形裁剪";
    
    self.changeOverlap.on = _isOverlap = YES;
    
    [self configImageView:_isOverlap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)configImageView:(BOOL)isOverlap
{
    UIImage *bigImage  = [UIImage imageNamed:@"portrait.png"];
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
    
    
    UIImage *tlImage = [ClipImage rectangleImage:bigImage toRect:tlFrame];
    UIImage *tcImage = [ClipImage rectangleImage:bigImage toRect:tcFrame];
    UIImage *trImage = [ClipImage rectangleImage:bigImage toRect:trFrame];
    UIImage *clImage = [ClipImage rectangleImage:bigImage toRect:clFrame];
    UIImage *ccImage = [ClipImage rectangleImage:bigImage toRect:ccFrame];
    UIImage *crImage = [ClipImage rectangleImage:bigImage toRect:crFrame];
    UIImage *blImage = [ClipImage rectangleImage:bigImage toRect:blFrame];
    UIImage *bcImage = [ClipImage rectangleImage:bigImage toRect:bcFrame];
    UIImage *brImage = [ClipImage rectangleImage:bigImage toRect:brFrame];
    
    self.bigImageView.image = [ClipImage circleImage:bigImage
                                               width:30.0f
                                               color:[UIColor colorWithRed:1.0f
                                                                     green:1.0f
                                                                      blue:0.0f
                                                                     alpha:0.2f]
                                           isOverlap:isOverlap];
    
    self.tlImageView.image = [ClipImage circleImage:tlImage
                                              width:3.0f
                                              color:[UIColor redColor]
                                          isOverlap:isOverlap];
    self.tcImageView.image = [ClipImage circleImage:tcImage
                                              width:3.0f
                                              color:[UIColor greenColor]
                                          isOverlap:isOverlap];
    self.trImageView.image = [ClipImage circleImage:trImage
                                              width:3.0f
                                              color:[UIColor blueColor]
                                          isOverlap:isOverlap];
    self.clImageView.image = [ClipImage circleImage:clImage
                                              width:3.0f
                                              color:[UIColor cyanColor]
                                          isOverlap:isOverlap];
    self.ccImageView.image = [ClipImage circleImage:ccImage
                                              width:3.0f
                                              color:[UIColor magentaColor]
                                          isOverlap:isOverlap];
    self.crImageView.image = [ClipImage circleImage:crImage
                                              width:3.0f
                                              color:[UIColor orangeColor]
                                          isOverlap:isOverlap];
    self.blImageView.image = [ClipImage circleImage:blImage
                                              width:3.0f
                                              color:[UIColor purpleColor]
                                          isOverlap:isOverlap];
    self.bcImageView.image = [ClipImage circleImage:bcImage
                                              width:3.0f
                                              color:[UIColor brownColor]
                                          isOverlap:isOverlap];
    self.brImageView.image = [ClipImage circleImage:brImage
                                              width:3.0f
                                              color:[UIColor clearColor]
                                          isOverlap:isOverlap];
}


- (IBAction)changeOverlapAction:(id)sender
{
    _isOverlap = !_isOverlap;
    [self configImageView:_isOverlap];
}

@end
