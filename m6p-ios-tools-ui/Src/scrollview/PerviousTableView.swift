//
//  PerviousTableView.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/2.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

class PerviousTableView: UITableView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if point.y < 0 {
            return true
        } else {
            return super.point(inside: point, with: event)
        }
    }

}
