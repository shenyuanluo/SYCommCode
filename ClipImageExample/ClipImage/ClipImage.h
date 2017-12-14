//
//  ClipImage.h
//  ClipImage
//
//  Created by shenyuanluo on 2017/12/12.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClipImage : NSObject


/**
 裁剪图片（矩形）

 @param srcImage 源图片
 @param rect 目标 frame
 @return 裁剪后图片
 */
+ (UIImage *)rectangleImage:(UIImage *)srcImage
                     toRect:(CGRect)rect;


/**
 裁剪图片（圆形）

 @param srcImage 源图片
 @param bWidth 圆环边框宽度
 @param bColor 圆环边框颜色
 @param isOverlap 圆环边框是否重叠图片
 @return 裁剪后图片
 */
+ (UIImage *)circleImage:(UIImage *)srcImage
                   width:(CGFloat)bWidth
                   color:(UIColor *)bColor
               isOverlap:(BOOL)isOverlap;

@end
