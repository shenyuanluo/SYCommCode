//
//  CGSize+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import Foundation

extension CGSize: SYCompatible { }
extension SYWrapper where Base == CGSize {
    /// 向下取整
    var floorSize: CGSize {
        return CGSize(width: self.base.width.sy.floor, height: self.base.height.sy.floor)
    }
    
    /// 向上取整
    var ceilSize: CGSize {
        return CGSize(width: self.base.width.sy.ceil, height: self.base.height.sy.ceil)
    }
    
    /// 四舍五入
    var roundSize: CGSize {
        return CGSize(width: self.base.width.sy.round, height: self.base.height.sy.round)
    }
}
