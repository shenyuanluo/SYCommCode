//
//  UIButton+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit

extension SYWrapper where Base == UIButton {
    
    func active(delay: TimeInterval) {
        self.base.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            [weak base = self.base] in
            base?.isUserInteractionEnabled = true
        }
    }
}
