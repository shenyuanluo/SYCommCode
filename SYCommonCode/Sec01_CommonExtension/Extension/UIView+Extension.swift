//
//  UIView+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit

extension UIView: SYCompatible { }
extension SYWrapper where Base == UIView {

    var left: CGFloat {
        set {
            var frame       = self.base.frame
            frame.origin.x  = newValue
            self.base.frame = frame
        }
        get {
            return self.base.frame.origin.x
        }
    }
    
    var right: CGFloat {
        set {
            var frame       = self.base.frame
            frame.origin.x  = newValue - frame.size.width
            self.base.frame = frame
        }
        get {
            return self.base.frame.origin.x + self.base.frame.size.width
        }
    }
    
    var top: CGFloat {
        set {
            var frame       = self.base.frame
            frame.origin.y  = newValue
            self.base.frame = frame
        }
        get {
            return self.base.frame.origin.y
        }
    }
    
    var bottom: CGFloat {
        set {
            var frame       = self.base.frame
            frame.origin.y  = newValue - frame.size.height
            self.base.frame = frame
        }
        get {
            return self.base.frame.origin.y + self.base.frame.size.height
        }
    }
    
    var centerX: CGFloat {
        set {
            self.base.center = CGPoint(x: newValue, y: self.base.center.y)
        }
        get {
            return self.base.center.x
        }
    }
    
    var centerY: CGFloat {
        set {
            self.base.center = CGPoint(x: self.base.center.x, y: newValue)
        }
        get {
            return self.base.center.y
        }
    }
    
    var width: CGFloat {
        set {
            var frame        = self.base.frame
            frame.size.width = newValue
            self.base.frame  = frame
        }
        get {
            return self.base.frame.size.width
        }
    }
    
    var height: CGFloat {
        set {
            var frame         = self.base.frame
            frame.size.height = newValue
            self.base.frame   = frame
        }
        get {
            return self.base.frame.size.height
        }
    }
    
    var size: CGSize {
        set {
            var frame       = self.base.frame
            frame.size      = newValue
            self.base.frame = frame
        }
        get {
            return self.base.frame.size
        }
    }
}

