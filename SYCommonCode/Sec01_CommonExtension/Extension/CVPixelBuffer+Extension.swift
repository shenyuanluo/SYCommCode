//
//  CVPixelBuffer+Extension.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/4/24.
//

import VideoToolbox
import CoreImage

extension CVPixelBuffer: SYCompatible { }
extension SYWrapper where Base == CVPixelBuffer {
    var width: Int {
        get {
            CVPixelBufferGetWidth(self.base)
        }
    }
    var height: Int {
        get {
            CVPixelBufferGetHeight(self.base)
        }
    }
    var pixelFormat: OSType {
        get {
            CVPixelBufferGetPixelFormatType(self.base)
        }
    }
    var bytesPerRow: Int {
        get {
            CVPixelBufferGetBytesPerRow(self.base)
        }
    }
    var data: UnsafeMutableRawPointer? {
        get {
            CVPixelBufferGetBaseAddress(self.base)
        }
    }
    var dataSize: Int {
        get {
            CVPixelBufferGetDataSize(self.base)
        }
    }
    
    var yAddress: UnsafeMutableRawPointer? {
        get {
            CVPixelBufferGetBaseAddressOfPlane(self.base, 0)
        }
    }
    
    var uAddress: UnsafeMutableRawPointer? {
        get {
            CVPixelBufferGetBaseAddressOfPlane(self.base, 1)
        }
    }
    
    var vAddress: UnsafeMutableRawPointer? {
        get {
            CVPixelBufferGetBaseAddressOfPlane(self.base, 2)
        }
    }
    
    var uvAddress: UnsafeMutableRawPointer? {
        get {
            CVPixelBufferGetBaseAddressOfPlane(self.base, 1)
        }
    }
    
    var yuvData: UnsafeMutableRawPointer? {
        get {
            if kCVPixelFormatType_420YpCbCr8Planar == self.pixelFormat
                || kCVPixelFormatType_420YpCbCr8PlanarFullRange == self.pixelFormat {
                let ySize     = self.width * self.height
                let uSize     = ySize>>2
                let vSize     = uSize
                let buffSize  = ySize + uSize + vSize
                let yuvBuffer = UnsafeMutableRawPointer.allocate(byteCount: buffSize, alignment: 1)
                yuvBuffer.initializeMemory(as: UInt8.self, repeating: 0, count: buffSize)
                memcpy(yuvBuffer,                 self.yAddress, ySize)
                memcpy(yuvBuffer + ySize,         self.uAddress, uSize)
                memcpy(yuvBuffer + ySize + uSize, self.vAddress, vSize)
                return yuvBuffer
            } else if kCVPixelFormatType_420YpCbCr8BiPlanarFullRange == self.pixelFormat
                        || kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange == self.pixelFormat {
                let ySize     = self.width * self.height
                let uvSize    = ySize>>1
                let buffSize  = ySize + uvSize
                let yuvBuffer = UnsafeMutableRawPointer.allocate(byteCount: buffSize, alignment: 1)
                yuvBuffer.initializeMemory(as: UInt8.self, repeating: 0, count: buffSize)
                memcpy(yuvBuffer,         self.yAddress,  ySize)
                memcpy(yuvBuffer + ySize, self.uvAddress, uvSize)
                return yuvBuffer
            } else {
                return nil
            }
        }
    }
    
    func lock(_ flags: CVPixelBufferLockFlags = .readOnly) {
        CVPixelBufferLockBaseAddress(self.base, flags)
    }
    
    func unlock(_ flags: CVPixelBufferLockFlags = .readOnly) {
        CVPixelBufferUnlockBaseAddress(self.base, flags)
    }
    
    func rotate(to orientation: CGImagePropertyOrientation) -> CVPixelBuffer? {
        self.lock()
        defer {
            self.unlock()
        }
        var width  = self.width
        var height = self.height
        if .left == orientation || .leftMirrored == orientation
            || .right == orientation || .rightMirrored == orientation {
            width  = self.height
            height = self.width
        }
        var buffer: CVPixelBuffer? = nil
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         width,
                                         height,
                                         self.pixelFormat,
                                         nil,
                                         &buffer)
        if kCVReturnSuccess != status {
            print("Create rotate pixle buffer failed!")
            return nil
        }
        let ciImage = CIImage(cvPixelBuffer: self.base).oriented(orientation)
        let context = CIContext(options: nil)
        context.render(ciImage, to: buffer!)
        return buffer
    }
    
    static func create(with data: UnsafeMutableRawPointer, width: Int, height: Int, format: OSType) -> CVPixelBuffer? {
        
        var buffer: CVPixelBuffer? = nil
        let status = CVPixelBufferCreateWithBytes(kCFAllocatorDefault,
                                                  width,
                                                  height,
                                                  format,
                                                  data,
                                                  width * 4,
                                                  nil,
                                                  nil,
                                                  nil,
                                                  &buffer)
        if kCVReturnSuccess != status {
            print("Create pixle buffer failed!")
            return nil
        } else {
            return buffer
        }
    }
    
}
