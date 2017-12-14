//
//  UILabel+LineSpacing.m
//  AutoCellHeightExample
//
//  Created by shenyuanluo on 2017/12/12.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

#import "UILabel+LineSpacing.h"

@implementation UILabel (LineSpacing)


- (NSString *)paragraphText
{
    return self.attributedText.string;
}


- (void)setParagraphText:(NSString *)text
{
    if(!text || 0 == text.length)
    {
        return;
    }
    NSMutableAttributedString *attribStr    = [[NSMutableAttributedString alloc] initWithString:text];;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attribStr addAttribute:NSParagraphStyleAttributeName
                      value:paragraphStyle
                      range:NSMakeRange(0, text.length)];
    self.attributedText = attribStr;
}

@end
