//
//  Date+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import Foundation

extension Date: SYCompatible { }
extension SYWrapper where Base == Date {
    enum TimeFormat: String {
        case MMddHHmm                = "MM/dd HH:mm"
        case yyyyMMddHHmmss          = "yyyyMMddHHmmss"
        case yyyyMMddHHmmssSSS       = "yyyyMMddHHmmssSSS"
        case yyyyMMddHHmm            = "yyyy-MM-dd-HH.mm"
        case yyyy_MM_dd_HH_mm_ss     = "yyyy-MM-dd HH:mm:ss"
        case yyyy_MM_dd_HH_mm_ss_SSS = "yyyy-MM-dd HH:mm:ss.SSS"
        case yyyyMMdd_HHmmss         = "yyyyMMdd-HHmmss"
    }
    
    /// 时间戳
    /// - Parameter fmt: 格式
    /// - Returns: 时间戳字符串
    func timestamp(_ fmt: TimeFormat = .yyyyMMddHHmmss) -> String {
        let formatter        = DateFormatter()
        formatter.dateFormat = fmt.rawValue
        return formatter.string(from: self.base)
    }
}
