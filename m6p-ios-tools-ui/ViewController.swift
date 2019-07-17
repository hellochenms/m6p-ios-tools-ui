//
//  ViewController.swift
//  m6p-ios-tools-ui
//
//  Created by Chen,Meisong on 2019/7/2.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.backgroundColor = .blue
        label.m2_addCorners([.topLeft], radius: 5)
        
        return label
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.setBackgroundImage(UIImage.m2_colorGradientImage(fromColor: UIColor.red, toColor: UIColor.blue, size: CGSize(width: 100, height: 40)), for: .normal)
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        makeLayout()
    }
    
    private func addSubViews() {
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func makeLayout() {
        label.frame = CGRect(x: 20, y: 20, width: 100, height: 40)
        button.frame = CGRect(x: 20, y: label.frame.maxY + 20, width: 100, height: 40)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.m2_callMeAfterLayoutSubviews()
    }
}

extension ViewController {
    @objc private func onTap() {
        label.frame = CGRect(x: 20, y: 20, width: 100 + CGFloat.random(in: 10.0...50.0), height: 40 + CGFloat.random(in: 5...20.0))
        button.frame = CGRect(x: 20, y: label.frame.maxY + 20, width: 100, height: 40)
    }
}
