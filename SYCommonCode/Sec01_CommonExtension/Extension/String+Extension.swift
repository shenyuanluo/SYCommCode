//
//  String+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit

extension String: SYCompatible { }
extension SYWrapper where Base == String {
    func sizeWith(font: UIFont, maxWidth: CGFloat = UIDevice.sy.width) -> CGSize {
        let constrainedSize = CGSize(width: maxWidth, height: CGFloat(MAXFLOAT))
        var attributes      = [NSAttributedString.Key : Any]()
        attributes[.font]   = font
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let size = (NSString(string: self.base)).boundingRect(with: constrainedSize,
                                                              options: options,
                                                              attributes: attributes,
                                                              context: nil).size
        return size.sy.ceilSize
    }
    
    func sizeWith(font: UIFont, maxHeight: CGFloat = UIDevice.sy.height) -> CGSize {
        let constrainedSize = CGSize(width: CGFloat(MAXFLOAT), height: maxHeight)
        var attributes      = [NSAttributedString.Key : Any]()
        attributes[.font]   = font
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let size = (NSString(string: self.base)).boundingRect(with: constrainedSize,
                                                              options: options,
                                                              attributes: attributes,
                                                              context: nil).size
        return size.sy.ceilSize
    }
    
    func heightWith(font: UIFont, maxWidth: CGFloat = UIDevice.sy.width) -> CGFloat {
        return sizeWith(font: font, maxWidth: maxWidth).height.sy.ceil
    }
    
    func widthWith(font: UIFont, maxHeight: CGFloat = UIDevice.sy.height) -> CGFloat {
        return sizeWith(font: font, maxHeight: maxHeight).width.sy.ceil
    }
}

