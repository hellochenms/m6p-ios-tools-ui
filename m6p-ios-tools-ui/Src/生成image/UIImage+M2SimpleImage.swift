//
//  UIImage+M2SimpleImage.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/17.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

public enum M2GradientImageDirection {
    case left2Right
    case top2Bottom
    case leftTop2RightBottom
    case leftBottom2RightTop
}

extension UIImage {
    public static func m2_color1x1Image(_ color: UIColor) -> UIImage? {
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    public static func m2_colorGradientImage(fromColor: UIColor, toColor: UIColor, size: CGSize, direction: M2GradientImageDirection = .left2Right) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [fromColor, toColor].map {
            return $0.cgColor
        }
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: nil) else {
            return nil
        }
        
        var start: CGPoint
        var end: CGPoint
        switch direction {
        case .left2Right:
            start = CGPoint(x: 0, y: 0)
            end = CGPoint(x: size.width, y: 0)
        case .top2Bottom:
            start = CGPoint(x: 0, y: 0)
            end = CGPoint(x: 0, y: size.height)
        case .leftTop2RightBottom:
            start = CGPoint(x: 0, y: 0)
            end = CGPoint(x: size.width, y: size.height)
        case .leftBottom2RightTop:
            start = CGPoint(x: 0, y: size.height)
            end = CGPoint(x: size.width, y: 0)
        }
        context?.drawLinearGradient(gradient, start: start, end: end, options: [])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
}
