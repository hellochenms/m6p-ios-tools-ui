//
//  UIView+corner.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/6.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

extension UIView {
    public func m2_addCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        let info = M2ViewCornerInfo()
        info.corners = corners
        info.radius = radius
        info.bounds = self.bounds
        self.viewCornerInfo = info
        self.layer.mask = shapeLayer
    }
    
    public func m2_callMeAfterLayoutSubviews() {
        guard let info = viewCornerInfo else { return }
        
        if !self.bounds.equalTo(info.bounds) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: info.corners, cornerRadii: CGSize(width: info.radius, height: info.radius))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            self.layer.mask = shapeLayer
            info.bounds = self.bounds
        }
    }
}

extension UIView {
    private struct ExtensionPropertyKeys {
        static var cornerKey = ""
    }
    
    private var viewCornerInfo: M2ViewCornerInfo? {
        set {
            objc_setAssociatedObject(self, &ExtensionPropertyKeys.cornerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &ExtensionPropertyKeys.cornerKey) as? M2ViewCornerInfo
        }
    }
}

fileprivate class M2ViewCornerInfo {
    public var corners: UIRectCorner = .allCorners
    public var radius: CGFloat = 0
    public var bounds: CGRect = .zero
}
