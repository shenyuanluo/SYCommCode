//
//  UITableViewCell+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit

extension SYWrapper where Base == UITableViewCell {
    static var identifier: String {
        return UITableViewCell.description()
    }
}
