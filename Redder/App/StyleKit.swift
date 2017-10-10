//
//  StyleKit.swift
//  Redder
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class StyleKit : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawRedditLogo(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 342, height: 304), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 342, height: 304), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 342, y: resizedFrame.height / 304)


        //// Color Declarations
        let white = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

        //// Combined-Shape Drawing
        let combinedShapePath = UIBezierPath()
        combinedShapePath.move(to: CGPoint(x: 165.3, y: 95.07))
        combinedShapePath.addLine(to: CGPoint(x: 184, y: 6.5))
        combinedShapePath.addCurve(to: CGPoint(x: 188, y: 2.5), controlPoint1: CGPoint(x: 184.67, y: 4.5), controlPoint2: CGPoint(x: 186, y: 3.17))
        combinedShapePath.addCurve(to: CGPoint(x: 194, y: 2.5), controlPoint1: CGPoint(x: 190, y: 1.83), controlPoint2: CGPoint(x: 192, y: 1.83))
        combinedShapePath.addLine(to: CGPoint(x: 253.61, y: 15.41))
        combinedShapePath.addCurve(to: CGPoint(x: 278, y: 0), controlPoint1: CGPoint(x: 257.94, y: 6.3), controlPoint2: CGPoint(x: 267.23, y: 0))
        combinedShapePath.addCurve(to: CGPoint(x: 305, y: 27), controlPoint1: CGPoint(x: 292.91, y: 0), controlPoint2: CGPoint(x: 305, y: 12.09))
        combinedShapePath.addCurve(to: CGPoint(x: 278, y: 54), controlPoint1: CGPoint(x: 305, y: 41.91), controlPoint2: CGPoint(x: 292.91, y: 54))
        combinedShapePath.addCurve(to: CGPoint(x: 251, y: 27.39), controlPoint1: CGPoint(x: 263.22, y: 54), controlPoint2: CGPoint(x: 251.21, y: 42.12))
        combinedShapePath.addLine(to: CGPoint(x: 196, y: 15.5))
        combinedShapePath.addLine(to: CGPoint(x: 179.28, y: 95.16))
        combinedShapePath.addCurve(to: CGPoint(x: 278.41, y: 126.56), controlPoint1: CGPoint(x: 218.09, y: 96.63), controlPoint2: CGPoint(x: 252.97, y: 108.37))
        combinedShapePath.addCurve(to: CGPoint(x: 304.5, y: 116), controlPoint1: CGPoint(x: 285.16, y: 120.02), controlPoint2: CGPoint(x: 294.36, y: 116))
        combinedShapePath.addCurve(to: CGPoint(x: 342, y: 153.5), controlPoint1: CGPoint(x: 325.21, y: 116), controlPoint2: CGPoint(x: 342, y: 132.79))
        combinedShapePath.addCurve(to: CGPoint(x: 320.04, y: 187.64), controlPoint1: CGPoint(x: 342, y: 168.67), controlPoint2: CGPoint(x: 333, y: 181.73))
        combinedShapePath.addCurve(to: CGPoint(x: 321, y: 199.5), controlPoint1: CGPoint(x: 320.68, y: 191.53), controlPoint2: CGPoint(x: 321, y: 195.49))
        combinedShapePath.addCurve(to: CGPoint(x: 171, y: 304), controlPoint1: CGPoint(x: 321, y: 257.21), controlPoint2: CGPoint(x: 253.84, y: 304))
        combinedShapePath.addCurve(to: CGPoint(x: 21, y: 199.5), controlPoint1: CGPoint(x: 88.16, y: 304), controlPoint2: CGPoint(x: 21, y: 257.21))
        combinedShapePath.addCurve(to: CGPoint(x: 21.96, y: 187.64), controlPoint1: CGPoint(x: 21, y: 195.49), controlPoint2: CGPoint(x: 21.32, y: 191.53))
        combinedShapePath.addCurve(to: CGPoint(x: 0, y: 153.5), controlPoint1: CGPoint(x: 9, y: 181.73), controlPoint2: CGPoint(x: 0, y: 168.67))
        combinedShapePath.addCurve(to: CGPoint(x: 37.5, y: 116), controlPoint1: CGPoint(x: 0, y: 132.79), controlPoint2: CGPoint(x: 16.79, y: 116))
        combinedShapePath.addCurve(to: CGPoint(x: 63.59, y: 126.56), controlPoint1: CGPoint(x: 47.64, y: 116), controlPoint2: CGPoint(x: 56.84, y: 120.02))
        combinedShapePath.addCurve(to: CGPoint(x: 165.3, y: 95.07), controlPoint1: CGPoint(x: 89.6, y: 107.97), controlPoint2: CGPoint(x: 125.46, y: 96.11))
        combinedShapePath.close()
        combinedShapePath.move(to: CGPoint(x: 229.5, y: 208))
        combinedShapePath.addCurve(to: CGPoint(x: 257, y: 180.5), controlPoint1: CGPoint(x: 244.69, y: 208), controlPoint2: CGPoint(x: 257, y: 195.69))
        combinedShapePath.addCurve(to: CGPoint(x: 229.5, y: 153), controlPoint1: CGPoint(x: 257, y: 165.31), controlPoint2: CGPoint(x: 244.69, y: 153))
        combinedShapePath.addCurve(to: CGPoint(x: 202, y: 180.5), controlPoint1: CGPoint(x: 214.31, y: 153), controlPoint2: CGPoint(x: 202, y: 165.31))
        combinedShapePath.addCurve(to: CGPoint(x: 229.5, y: 208), controlPoint1: CGPoint(x: 202, y: 195.69), controlPoint2: CGPoint(x: 214.31, y: 208))
        combinedShapePath.close()
        combinedShapePath.move(to: CGPoint(x: 112.5, y: 208))
        combinedShapePath.addCurve(to: CGPoint(x: 140, y: 180.5), controlPoint1: CGPoint(x: 127.69, y: 208), controlPoint2: CGPoint(x: 140, y: 195.69))
        combinedShapePath.addCurve(to: CGPoint(x: 112.5, y: 153), controlPoint1: CGPoint(x: 140, y: 165.31), controlPoint2: CGPoint(x: 127.69, y: 153))
        combinedShapePath.addCurve(to: CGPoint(x: 85, y: 180.5), controlPoint1: CGPoint(x: 97.31, y: 153), controlPoint2: CGPoint(x: 85, y: 165.31))
        combinedShapePath.addCurve(to: CGPoint(x: 112.5, y: 208), controlPoint1: CGPoint(x: 85, y: 195.69), controlPoint2: CGPoint(x: 97.31, y: 208))
        combinedShapePath.close()
        combinedShapePath.move(to: CGPoint(x: 108.06, y: 252.55))
        combinedShapePath.addCurve(to: CGPoint(x: 171, y: 270.5), controlPoint1: CGPoint(x: 124.45, y: 264.56), controlPoint2: CGPoint(x: 145.5, y: 270.5))
        combinedShapePath.addCurve(to: CGPoint(x: 233.94, y: 252.55), controlPoint1: CGPoint(x: 196.5, y: 270.5), controlPoint2: CGPoint(x: 217.55, y: 264.56))
        combinedShapePath.addCurve(to: CGPoint(x: 235.55, y: 242.06), controlPoint1: CGPoint(x: 237.28, y: 250.1), controlPoint2: CGPoint(x: 238, y: 245.41))
        combinedShapePath.addCurve(to: CGPoint(x: 225.06, y: 240.45), controlPoint1: CGPoint(x: 233.1, y: 238.72), controlPoint2: CGPoint(x: 228.41, y: 238))
        combinedShapePath.addCurve(to: CGPoint(x: 171, y: 255.5), controlPoint1: CGPoint(x: 211.45, y: 250.44), controlPoint2: CGPoint(x: 193.5, y: 255.5))
        combinedShapePath.addCurve(to: CGPoint(x: 116.94, y: 240.45), controlPoint1: CGPoint(x: 148.5, y: 255.5), controlPoint2: CGPoint(x: 130.55, y: 250.44))
        combinedShapePath.addCurve(to: CGPoint(x: 106.45, y: 242.06), controlPoint1: CGPoint(x: 113.59, y: 238), controlPoint2: CGPoint(x: 108.9, y: 238.72))
        combinedShapePath.addCurve(to: CGPoint(x: 108.06, y: 252.55), controlPoint1: CGPoint(x: 104, y: 245.41), controlPoint2: CGPoint(x: 104.72, y: 250.1))
        combinedShapePath.close()
        combinedShapePath.usesEvenOddFillRule = true
        white.setFill()
        combinedShapePath.fill()
        
        context.restoreGState()

    }




    @objc(StyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
