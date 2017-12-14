//
//  ClipImage.m
//  ClipImage
//
//  Created by shenyuanluo on 2017/12/12.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "ClipImage.h"

@implementation ClipImage

#pragma mark --  裁剪图片（矩形）
+ (UIImage *)rectangleImage:(UIImage *)srcImage
                     toRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([srcImage CGImage], rect);
    UIImage *dstImage   = [UIImage imageWithCGImage:imageRef
                                              scale:1
                                        orientation:UIImageOrientationUp];
    CGImageRelease(imageRef);
    return dstImage;
}


#pragma mark --  裁剪图片（圆形)
+ (UIImage *)circleImage:(UIImage *)srcImage
                   width:(CGFloat)bWidth
                   color:(UIColor *)bColor
               isOverlap:(BOOL)isOverlap

{
    if (0 > bWidth)
    {
        bWidth = 0;
    }
    CGFloat scale         = [[UIScreen mainScreen] scale];
    CGFloat imgWidth      = srcImage.size.width;
    CGFloat imgHeight     = srcImage.size.height;
    CGFloat rectangleWH   = imgWidth < imgHeight ? imgWidth : imgHeight;        // 正方形图片的边长
    CGPoint center        = CGPointMake(rectangleWH * 0.5, rectangleWH * 0.5);  // 圆心
    CGFloat annulusRadius = (rectangleWH - bWidth * scale) * 0.5;               // 圆环的半径
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rectangleWH, rectangleWH), NO, 0);
    if (NO == isOverlap)    // 先画圆环 -——> 再裁剪圆图
    {
        [self drawAnnulusCenter:center
                         radius:annulusRadius
                          width:bWidth
                          color:bColor];
        
        [self drawCircleImage:srcImage
                       Center:center
                       radius:(rectangleWH - 2 * bWidth * scale) * 0.5];
    }
    else // 先裁剪圆图 -——> 再画圆环
    {
        [self drawCircleImage:srcImage
                       Center:center
                       radius:rectangleWH * 0.5];
        
        [self drawAnnulusCenter:center
                         radius:annulusRadius
                          width:bWidth
                          color:bColor];
    }
    
    // 获取画布的图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return clipImage;
}


#pragma mark -- 画圆环
+ (void)drawAnnulusCenter:(CGPoint)center
                   radius:(CGFloat)radius
                    width:(CGFloat)width
                    color:(UIColor *)color
{
    // 2.获取圆环贝塞尔路径
    UIBezierPath *arcWHPath = [UIBezierPath bezierPathWithArcCenter:center
                                                             radius:radius
                                                         startAngle:0
                                                           endAngle:M_PI * 2
                                                          clockwise:YES];
    // 3.配置圆环
    arcWHPath.lineWidth = width * [[UIScreen mainScreen] scale];
    [color setStroke];
    [arcWHPath stroke];
}


#pragma mark -- 裁圆图
+ (void)drawCircleImage:(UIImage *)srcImage
                 Center:(CGPoint)center
                 radius:(CGFloat)radius
{
    // 获取圆图贝塞尔路径
    UIBezierPath *arcWHPath2 = [UIBezierPath bezierPathWithArcCenter:center
                                                              radius:radius
                                                          startAngle:0
                                                            endAngle:M_PI * 2
                                                           clockwise:YES];
    
    // 裁剪圆形
    [arcWHPath2 addClip];
    
    // 把图片塞进上下文中
    [srcImage drawAtPoint:CGPointMake(0, 0)];
}

@end
