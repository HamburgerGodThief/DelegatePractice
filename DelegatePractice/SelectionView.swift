//
//  SelectionView.swift
//  DelegatePractice
//
//  Created by Hamburger on 2020/1/13.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation
import UIKit

protocol SelectionViewDelegate: AnyObject {
    
}

protocol SelectionViewDataSource: AnyObject {
    
    func numberOfOption(_ selectionView: SelectionView) -> Int
    
    func textOnButton(_ selectionView: SelectionView) -> String
    
    func colorOfUnderLine(_ selectionView: SelectionView) -> UIColor
    
    func colorOfTextOnButton(_ selectionView: SelectionView)
    
    func fontOfTextOnButton(_ selectionView: SelectionView)
}

class SelectionView: UIView {
    
    weak var delegate: SelectionViewDelegate?
    weak var dataSource: SelectionViewDataSource?
    
    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .black
        return stack
    }()
    
    let optionButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.isEnabled = true
        btn.backgroundColor = .black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return btn
    }()
    
    let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setButtonAndIndicator() {
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        optionButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}


class View: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
}
