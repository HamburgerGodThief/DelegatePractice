//
//  SecondViewController.swift
//  PassValue
//
//  Created by Hamburger on 2020/1/15.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
        
    let textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        return text
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.titleLabel?.textColor = .white
        return btn
    }()
    
    func setTextField() {
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 2 / 3, constant: 0),
            NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        ])
    }
    
    func setButton() {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 2 / 3, constant: 0),
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setButton()
    }
}
