//
//  UICollectionView+Reload.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/6.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func m2_reloadDataNoAnimation() {
        CATransaction.setDisableActions(true)
        self.reloadData()
        CATransaction.commit()
    }
}
