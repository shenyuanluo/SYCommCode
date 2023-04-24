//
//  Array+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import Foundation

extension Array where Element: Comparable  {
    /// 最小值下标
    var argmin: Int? {
        get {
            guard var minV = first else { return nil }
            var idx = 0
            for i in 1..<count {
                if self[i] < minV {
                    idx  = i
                    minV = self[i]
                }
            }
            return idx
        }
    }
}
