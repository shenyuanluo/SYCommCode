//
//  SYWrapper.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import Foundation

public struct SYWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}


public protocol SYCompatible { }
extension SYCompatible {
    public var sy: SYWrapper<Self> {
        get { return SYWrapper(self) }
        set { }
    }
    static var sy: SYWrapper<Self>.Type { return SYWrapper<Self>.self }
}
