//
//  Float+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import Foundation

extension Float: SYCompatible { }
extension SYWrapper where Base == Float {
    var sign: Float {
        get {
            if self.base < 0 {
                return -1
            } else if self.base > 0 {
                return 1
            } else {
                return 0
            }
        }
    }
}
