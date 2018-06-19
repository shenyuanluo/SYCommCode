//
//  ViewController.m
//  ScalingViewExample
//
//  Created by shenyuanluo on 2018/3/5.
//  Copyright © 2018年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "ViewController.h"
#import "ScalingView.h"

@interface ViewController ()
{
    BOOL m_isLandscape;
}
@property (weak, nonatomic) IBOutlet UIView *showView1;
@property (weak, nonatomic) IBOutlet UIView *showView2;

@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    m_isLandscape = YES;
    
    // 横屏展示横屏视图
    CGRect rect1 = [ScalingView scaleWithSubSize:CGSizeMake(1800, 1200)
                                    inParentSize:CGSizeMake(320, 180)];
    self.imgView1 = [[UIImageView alloc] initWithFrame:rect1];
    self.imgView1.image = [UIImage imageNamed:@"CuriousFrog.jpg"];
    [self.showView1 addSubview:self.imgView1];
    
    // 竖屏展示竖屏视图
    CGRect rect2 = [ScalingView scaleWithSubSize:CGSizeMake(1280, 1920)
                                    inParentSize:CGSizeMake(180, 320)];
    self.imgView2 = [[UIImageView alloc] initWithFrame:rect2];
    self.imgView2.image = [UIImage imageNamed:@"LeggyFrog.jpg"];
    [self.showView2 addSubview:self.imgView2];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)refreshBtnAction:(id)sender
{
    m_isLandscape = !m_isLandscape;
    
    [self.imgView1 removeFromSuperview];
    [self.imgView2 removeFromSuperview];
    
    if (NO == m_isLandscape)
    {
        // 横屏展示竖屏视图
        CGRect rect1 = [ScalingView scaleWithSubSize:CGSizeMake(1280, 1920)
                                        inParentSize:CGSizeMake(320, 180)];
        self.imgView1 = [[UIImageView alloc] initWithFrame:rect1];
        self.imgView1.image = [UIImage imageNamed:@"LeggyFrog.jpg"];
        [self.showView1 addSubview:self.imgView1];
        
        // 竖屏展示横屏视图
        CGRect rect2 = [ScalingView scaleWithSubSize:CGSizeMake(1800, 1200)
                                        inParentSize:CGSizeMake(180, 320)];
        self.imgView2 = [[UIImageView alloc] initWithFrame:rect2];
        self.imgView2.image = [UIImage imageNamed:@"CuriousFrog.jpg"];
        [self.showView2 addSubview:self.imgView2];
    }
    else
    {
        // 横屏展示横屏视图
        CGRect rect1 = [ScalingView scaleWithSubSize:CGSizeMake(1800, 1200)
                                        inParentSize:CGSizeMake(320, 180)];
        self.imgView1 = [[UIImageView alloc] initWithFrame:rect1];
        self.imgView1.image = [UIImage imageNamed:@"CuriousFrog.jpg"];
        [self.showView1 addSubview:self.imgView1];
        
        // 竖屏展示竖屏视图
        CGRect rect2 = [ScalingView scaleWithSubSize:CGSizeMake(1280, 1920)
                                        inParentSize:CGSizeMake(180, 320)];
        self.imgView2 = [[UIImageView alloc] initWithFrame:rect2];
        self.imgView2.image = [UIImage imageNamed:@"LeggyFrog.jpg"];
        [self.showView2 addSubview:self.imgView2];
    }
}



@end
