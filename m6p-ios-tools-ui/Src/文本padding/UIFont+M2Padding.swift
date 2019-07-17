//
//  UIFont+M2Padding.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/17.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

extension UIFont {
    public func m2_padding() -> CGFloat {
        let padding = max((self.lineHeight - self.pointSize) / 2, 0)
        
        return padding
    }
    
    public func m2_lineSpacingWithUIMarkLineSpaing(uiMarkLineSpacing: CGFloat) -> CGFloat {
        let linespacing = max(uiMarkLineSpacing - (self.lineHeight - self.pointSize), 0)
        
        return linespacing
    }
}
