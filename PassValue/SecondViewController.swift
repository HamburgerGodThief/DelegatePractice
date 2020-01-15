//
//  SecondViewController.swift
//  PassValue
//
//  Created by Hamburger on 2020/1/15.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation
import UIKit

//protocol SecondViewControllerDelegate: AnyObject {
//
//    func passBackToVC(_ secondViewController: SecondViewController)
//
//    func passAndCreate(_ secondViewController: SecondViewController)
//}

class SecondViewController: UIViewController {
    
//    weak var delegate: SecondViewControllerDelegate?
    var textHandler: ((UITextField) -> Void)?
    var passBack: ((UITextField) -> Void)?
    var indexPath: IndexPath?
    let textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        return text
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.titleLabel?.textColor = .white
        btn.setTitle("Button", for: .normal)
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
        button.addTarget(self, action: #selector(didTouchButton(sender:)), for: .touchUpInside)
    }
    
    @objc func didTouchButton(sender: UIButton) {
        if indexPath != nil {
//            delegate?.passBackToVC(self)
            self.navigationController?.popViewController(animated: true)
            guard let handler = passBack else { return }
            handler(textField)
        } else {
//            delegate?.passAndCreate(self)
            self.navigationController?.popViewController(animated: true)
            guard let handler = textHandler else { return }
            handler(textField)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setButton()
    }
}
