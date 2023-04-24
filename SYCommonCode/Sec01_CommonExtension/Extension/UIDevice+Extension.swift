//
//  UIDevice+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit

extension UIDevice: SYCompatible { }
extension SYWrapper where Base == UIDevice {
    /// 屏幕-宽度
    static var width: CGFloat  = UIScreen.main.bounds.size.width
    /// 屏幕-高度
    static var height: CGFloat = UIScreen.main.bounds.size.height
    /// 屏幕-Scale
    static var scale: CGFloat  = UIScreen.main.scale
    /// 顶部安全距离
    static var safeTopMargin: CGFloat = {
        var top: CGFloat = 0
        var window: UIWindow? = UIApplication.shared.windows.first
        if false == window?.isKeyWindow {
            let keyWindow: UIWindow? = UIApplication.shared.delegate?.window ?? nil
            if nil != keyWindow && keyWindow!.bounds.equalTo(UIScreen.main.bounds) {
                window = keyWindow
            }
        }
        if #available(iOS 11.0, *) {
            top = window?.safeAreaInsets.top ?? 0
        }
        
        return top
    }()
    /// 底部安全距离
    static var safeBottomMargin: CGFloat = {
        var bottom: CGFloat = 0
        var window: UIWindow? = UIApplication.shared.windows.first
        if false == window?.isKeyWindow {
            let keyWindow: UIWindow? = UIApplication.shared.delegate?.window ?? nil
            if nil != keyWindow && keyWindow!.bounds.equalTo(UIScreen.main.bounds) {
                window = keyWindow
            }
        }
        if #available(iOS 11.0, *) {
            bottom = window?.safeAreaInsets.bottom ?? 0
        }
        return bottom
    }()
    /// 状态栏高度
    static var statusBarHeight: CGFloat = {
        return 0 < safeTopMargin ? safeTopMargin : 20
    }()
    /// 导航栏高度
    static var navigationBarHeight: CGFloat = {
        return statusBarHeight + 44
    }()
    /// 磁盘-总容量
    static var totalDiskSpace: Int64 {  // In bytes
        guard let attr = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
              let space = (attr[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }
    /// 磁盘-剩余容量
    static var freeDiskSpace: Int64 {    // In bytes
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space
            } else {
                return 0
            }
        } else {
            if let attr = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
               let freeSpace = (attr[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }
    /// 磁盘-已用容量
    static var usedDiskSpace:Int64 { // In bytes
        return totalDiskSpace - freeDiskSpace
    }
    
    /// 切换朝向
    /// - Parameter orientation: 方向
    static func switchTo(new orientation: UIInterfaceOrientation) {
        let resetValue: NSNumber = NSNumber(value: UIInterfaceOrientation.unknown.rawValue)
        UIDevice.current.setValue(resetValue, forKey: "orientation")
        let orientationValue: NSNumber = NSNumber(value: orientation.rawValue)
        UIDevice.current.setValue(orientationValue, forKey: "orientation")
    }
}


extension SYWrapper where Base == UIDevice {
    enum DevNameType: String {
        case unknow             = "Unknow"
        case simulator          = "Simulator"
        case iPhone_4           = "iPhone 4"
        case iPhone_4s          = "iPhone 4S"
        case iPhone_5           = "iPhone 5"
        case iPhone_5c          = "iPhone 5C"
        case iPhone_5s          = "iPhone 5S"
        case iPhone_6           = "iPhone 6"
        case iPhone_6_plus      = "iPhone 6 Plus"
        case iPhone_6s          = "iPhone 6S"
        case iPhone_6s_plus     = "iPhone 6S Plus"
        case iPhone_se          = "iPhone SE"
        case iPhone_se_2        = "iPhone SE 2"    // 2020
        case iPhone_se_3        = "iPhone SE 3"    // 2022
        case iPhone_7           = "iPhone 7"
        case iPhone_7_plus      = "iPhone 7 Plus"
        case iPhone_8           = "iPhone 8"
        case iPhone_8_plus      = "iPhone 8 Plus"
        case iPhone_x           = "iPhone X"
        case iPhone_xs          = "iPhone XS"
        case iPhone_xs_max      = "iPhone XS Max"
        case iPhone_xr          = "iPhone XR"
        case iPhone_11          = "iPhone 11"
        case iPhone_11_pro      = "iPhone 11 Pro"
        case iPhone_11_pro_max  = "iPhone 11 Pro Max"
        case iPhone_12_mini     = "iPhone 12 Mini"
        case iPhone_12          = "iPhone 12"
        case iPhone_12_pro      = "iPhone 12 Pro"
        case iPhone_12_pro_max  = "iPhone 12 Pro Max"
        case iPhone_13_mini     = "iPhone 13 Mini"
        case iPhone_13          = "iPhone 13"
        case iPhone_13_pro      = "iPhone 13 Pro"
        case iPhone_13_pro_max  = "iPhone 13 Pro Max"
        case iPhone_14          = "iPhone 14"
        case iPhone_14_plus     = "iPhone 14 Plus"
        case iPhone_14_pro      = "iPhone 14 Pro"
        case iPhone_14_pro_max  = "iPhone 14 Pro Max"
        // iPad
        case iPad_1          = "iPad 1"
        case iPad_2          = "iPad 2"
        case iPad_3          = "iPad 3"
        case iPad_4          = "iPad 4"
        case iPad_5_wifi     = "iPad 5 (WiFi)"
        case iPad_5_cellular = "iPad 6 (Cellular)"
        case iPad_6          = "iPad 6"
        case iPad_7          = "iPad 7"
        case iPad_8          = "iPad 8"
        case iPad_9          = "iPad 9"
        // iPad Air
        case iPad_air_1 = "iPad Air 1"
        case iPad_air_2 = "iPad Air 2"
        case iPad_air_3 = "iPad Air 3"
        case iPad_air_4 = "iPad Air 4"
        case iPad_air_5 = "iPad Air 5"
        // iPad Mini
        case iPad_mini_1 = "iPad Mini 1"
        case iPad_mini_2 = "iPad Mini 2"
        case iPad_mini_3 = "iPad Mini 3"
        case iPad_mini_4 = "iPad Mini 4"
        case iPad_mini_5 = "iPad Mini 5"
        case iPad_mini_6 = "iPad Mini 6"
        // iPad Pro
        case iPad_pro_9_7            = "iPad Pro 9.7-inch"
        case iPad_pro_10_5_wifi      = "iPad Pro 10.5-inch (WiFi)"
        case iPad_pro_10_5_cellular  = "iPad Pro 10.5-inch (Cellular)"
        case iPad_pro_11__1          = "iPad Pro 11-inch"
        case iPad_pro_11__2          = "iPad Pro 11-inch (2nd generation)"
        case iPad_pro_11__3          = "iPad Pro 11-inch (3rd generation)"
        case iPad_pro_12_9__1        = "iPad Pro 12.9-inch"
        case iPad_pro_12_9__wifi     = "iPad Pro 12.9-inch  (WiFi)"
        case iPad_pro_12_9__cellular = "iPad Pro 12.9-inch  (Cellular)"
        case iPad_pro_12_9__3        = "iPad Pro 12.9-inch (3rd generation)"
        case iPad_pro_12_9__4        = "iPad Pro 12.9-inch (4th generation)"
        case iPad_pro_12_9__5        = "iPad Pro 12.9-inch (5th generation)"
    }
    
    static func nameType() -> DevNameType {
        var sysInfo = utsname()
        uname(&sysInfo)
        let machineMirror = Mirror(reflecting: sysInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
            // Simulator
            case "i386", "x86_64"   : return .simulator
            // iPhone
            case "iPhone3,1", "iPhone3,2", "iPhone3,3"  : return .iPhone_4
            case "iPhone4,1"                            : return .iPhone_4s
            case "iPhone5,1",  "iPhone5,2"              : return .iPhone_5
            case "iPhone5,3",  "iPhone5,4"              : return .iPhone_5c
            case "iPhone6,1",  "iPhone6,2"              : return .iPhone_5s
            case "iPhone7,2"                            : return .iPhone_6
            case "iPhone7,1"                            : return .iPhone_6_plus
            case "iPhone8,1"                            : return .iPhone_6s
            case "iPhone8,2"                            : return .iPhone_6s_plus
            case "iPhone8,4"                            : return .iPhone_se
            case "iPhone12,8"                           : return .iPhone_se_2
            case "iPhone14,6"                           : return .iPhone_se_3
            case "iPhone9,1",  "iPhone9,3"              : return .iPhone_7
            case "iPhone9,2",  "iPhone9,4"              : return .iPhone_7_plus
            case "iPhone10,1", "iPhone10,4"             : return .iPhone_8
            case "iPhone10,2", "iPhone10,5"             : return .iPhone_8_plus
            case "iPhone10,3", "iPhone10,6"             : return .iPhone_x
            case "iPhone11,2"                           : return .iPhone_xs
            case "iPhone11,4", "iPhone11,6"             : return .iPhone_xs_max
            case "iPhone11,8"                           : return .iPhone_xr
            case "iPhone12,1"                           : return .iPhone_11
            case "iPhone12,3"                           : return .iPhone_11_pro
            case "iPhone12,5"                           : return .iPhone_11_pro_max
            case "iPhone13,1"                           : return .iPhone_12_mini
            case "iPhone13,2"                           : return .iPhone_12
            case "iPhone13,3"                           : return .iPhone_12_pro
            case "iPhone13,4"                           : return .iPhone_12_pro_max
            case "iPhone14,4"                           : return .iPhone_13_mini
            case "iPhone14,5"                           : return .iPhone_13
            case "iPhone14,2"                           : return .iPhone_13_pro
            case "iPhone14,3"                           : return .iPhone_13_pro_max
            case "iPhone14,7"                           : return .iPhone_14
            case "iPhone14,8"                           : return .iPhone_14_plus
            case "iPhone15,2"                           : return .iPhone_14_pro
            case "iPhone15,3"                           : return .iPhone_14_pro_max
            
            // iPad
            case "iPad1,1"                                  : return .iPad_1
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4" : return .iPad_2
            case "iPad3,1", "iPad3,2", "iPad3,3"            : return .iPad_3
            case "iPad3,4", "iPad3,5", "iPad3,6"            : return .iPad_4
            case "iPad6,11"                                 : return .iPad_5_wifi
            case "iPad6,12"                                 : return .iPad_5_cellular
            case "iPad7,5",  "iPad7,6"                      : return .iPad_6
            case "iPad7,11", "iPad7,12"                     : return .iPad_7
            case "iPad11,6", "iPad11,7"                     : return .iPad_8
            case "iPad12,1", "iPad12,2"                     : return .iPad_9
            // iPad Air
            case "iPad4,1",   "iPad4,2", "iPad4,3"  : return .iPad_air_1
            case "iPad5,3",   "iPad5,4"             : return .iPad_air_2
            case "iPad11,3",  "iPad11,4"            : return .iPad_air_3
            case "iPad13,1",  "iPad13,2"            : return .iPad_air_4
            case "iPad13,16", "iPad13,17"           : return .iPad_air_5
            // iPad Mini
            case "iPad2,5",  "iPad2,6", "iPad2,7"   : return .iPad_mini_1
            case "iPad4,4",  "iPad4,5", "iPad4,6"   : return .iPad_mini_2
            case "iPad4,7",  "iPad4,8", "iPad4,9"   : return .iPad_mini_3
            case "iPad5,1",  "iPad5,2"              : return .iPad_mini_4
            case "iPad11,1", "iPad11,2"             : return .iPad_mini_5
            case "iPad14,1", "iPad14,2"             : return .iPad_mini_6
            // iPad Pro
            case "iPad6,7", "iPad6,8"                               : return .iPad_pro_12_9__1
            case "iPad6,3", "iPad6,4"                               : return .iPad_pro_9_7
            case "iPad7,1"                                          : return .iPad_pro_12_9__wifi
            case "iPad7,2"                                          : return .iPad_pro_12_9__cellular
            case "iPad7,3"                                          : return .iPad_pro_10_5_wifi
            case "iPad7,4"                                          : return .iPad_pro_10_5_cellular
            case "iPad8,1",  "iPad8,2",  "iPad8,3",   "iPad8,4"     : return .iPad_pro_11__1
            case "iPad8,5",  "iPad8,6",  "iPad8,7",   "iPad8,8"     : return .iPad_pro_12_9__3
            case "iPad8,9",  "iPad8,10"                             : return .iPad_pro_11__2
            case "iPad8,11", "iPad8,12"                             : return .iPad_pro_12_9__4
            case "iPad13,4", "iPad13,5", "iPad13,6",  "iPad13,7"    : return .iPad_pro_11__3
            case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11"   : return .iPad_pro_12_9__5
            
            default : return .unknow
        }
    }
    
    static var isAboveIPhone12: Bool = {
        let type = UIDevice.sy.nameType()
        if .iPhone_12_mini == type || .iPhone_12 == type || .iPhone_12_pro == type || .iPhone_12_pro_max == type
            || .iPhone_13_mini == type || .iPhone_13 == type || .iPhone_13_pro == type || .iPhone_13_pro_max == type
            || .iPhone_14 == type || .iPhone_14_plus == type || .iPhone_14_pro == type || .iPhone_14_pro_max == type{
            return true
        } else {
            return false
        }
    }()
}
