//
//  UIView+corner.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/6.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

extension UIView {
    // 操作self.layer.mask
    public func m2_addCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
    }
    
    // 操作self.layer.mask
    public func m2_removeCorners() {
        self.layer.mask = nil
    }
}
