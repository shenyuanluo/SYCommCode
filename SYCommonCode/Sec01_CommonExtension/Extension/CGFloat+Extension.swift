//
//  CGFloat+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import Foundation

extension CGFloat: SYCompatible { }
extension SYWrapper where Base == CGFloat {
    /// 向下取整
    var floor: CGFloat {
        return Foundation.floor(self.base)
    }
    
    /// 向上取整
    var ceil: CGFloat {
        return Foundation.ceil(self.base)
    }
    
    /// 四舍五入
    var round: CGFloat {
        return Foundation.round(self.base)
    }
}
