//
//  CustomView.swift
//  AutoLayoutEventCycle
//
//  Created by Hamburger on 2020/1/16.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    let smallCircle = UIView()
    let small2Circle = UIView()
    
    func twoSmallCircle() {
        
        smallCircle.backgroundColor = .green
        
        self.addSubview(smallCircle)
        smallCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            smallCircle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            smallCircle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            smallCircle.widthAnchor.constraint(equalToConstant: self.frame.size.width / 2),
            smallCircle.heightAnchor.constraint(equalToConstant: self.frame.size.height / 2)
        ])
                
        //---------------------
        
        small2Circle.backgroundColor = .blue
        
        self.addSubview(small2Circle)
        small2Circle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            small2Circle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            small2Circle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            small2Circle.widthAnchor.constraint(equalToConstant: self.frame.size.width / 2),
            small2Circle.heightAnchor.constraint(equalToConstant: self.frame.size.height / 2)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        twoSmallCircle()
        smallCircle.layer.cornerRadius = self.frame.size.width / 4
        small2Circle.layer.cornerRadius = self.frame.size.width / 4
    }
    
}
