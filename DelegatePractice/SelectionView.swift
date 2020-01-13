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
    
    func colorOfUnderLine(_ selectionView: SelectionView) -> UIColor?
    
    func colorOfTextOnButton(_ selectionView: SelectionView) -> UIColor?
    
    func fontOfTextOnButton(_ selectionView: SelectionView) -> UIFont?
}

class SelectionView: UIView {
    
    weak var delegate: SelectionViewDelegate? {
        
        didSet {
            setButton()
        }
        
    }
    
    weak var dataSource: SelectionViewDataSource? {
        
        didSet {
            setButton()
        }
        
    }
    
    var arrayButton = [UIButton]()
    
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
    
    let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    func setColorView() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(colorView)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: colorView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: colorView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: colorView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: colorView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        ])
    }
    
    func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.spacing = 0
        addSubview(stackView)
        //stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: colorView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        ])
    }
    
    func setButton() {
        guard let numberOfButton = dataSource?.numberOfOption(self) else { return }
        for _ in 0...numberOfButton - 1 {
            let optionButton: UIButton = {
                let btn = UIButton()
                btn.setTitleColor(.white, for: .normal)
                btn.isEnabled = true
                btn.backgroundColor = .yellow
                btn.layer.borderColor = UIColor.gray.cgColor
                btn.layer.borderWidth = 2
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                return btn
            }()
            arrayButton.append(optionButton)
            stackView.addArrangedSubview(optionButton)
        }
    }
    
    func setIndicatorLine() {
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: indicatorView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2),
            NSLayoutConstraint(item: indicatorView, attribute: .bottom, relatedBy: .equal, toItem: colorView, attribute: .top, multiplier: 1, constant: -2)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setColorView()
        setStackView()
        setButton()
        setIndicatorLine()
        self.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
