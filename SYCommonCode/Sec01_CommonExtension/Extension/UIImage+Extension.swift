//
//  UIImage+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import UIKit
import VideoToolbox

extension UIImage: SYCompatible { }
extension SYWrapper where Base == UIImage {
    
    static func imageWith(colors: [UIColor], size: CGSize, cornerRadius: CGFloat = 0) -> UIImage {
        if size.equalTo(.zero) || 0 == colors.count { return UIImage() }

        defer { UIGraphicsEndImageContext() }
        
        let maxRadius    = min(size.width, size.height) / 2.0
        let resultRadius = 0 < cornerRadius ? (cornerRadius > maxRadius ? maxRadius : cornerRadius) : 0
        let rect         = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        var cgColors: [CGColor] = []
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        if 0 < resultRadius {
            UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        }
        if let context = UIGraphicsGetCurrentContext() {
            if 1 == colors.count {
                context.setFillColor(colors[0].cgColor)
                context.fill(rect)
            } else if let gradient = CGGradient(colorsSpace: cgColors.last!.colorSpace,
                                                colors: cgColors as CFArray,
                                                locations: nil) {
                context.drawLinearGradient(gradient,
                                           start: CGPoint(x: 0, y: 0),
                                           end: CGPoint(x: size.width, y: 0),
                                           options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
            }
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image ?? UIImage()
        } else {
            return UIImage()
        }
    }
    
    static func imageWith(pixelBuffer: CVPixelBuffer) -> UIImage? {
        var cgImage: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)
        guard let cgImage = cgImage else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }
}
