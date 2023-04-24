//
//  UIFont+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit

fileprivate enum SYFont: String {
    case regular    = "PingFangSC-Regular"
    case medium     = "PingFangSC-Medium"
    case semibold   = "PingFangSC-Semibold"
    case light      = "PingFangSC-Light"
    case thin       = "PingFangSC-Thin"
    case ultralight = "PingFangSC-Ultralight"
}

extension UIFont: SYCompatible { }
extension SYWrapper where Base == UIFont {
    
    static func regular(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: SYFont.regular.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func medium(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: SYFont.medium.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }

    static func semibold(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: SYFont.semibold.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func light(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: SYFont.light.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func thin(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: SYFont.thin.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func ultralight(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: SYFont.ultralight.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }


}
