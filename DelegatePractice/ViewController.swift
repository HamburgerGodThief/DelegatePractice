//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Hamburger on 2020/1/13.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topSelectionView = SelectionView()
    let bottomSelectionView = SelectionView()
    
    func setSelectionView() {
        view.addSubview(topSelectionView)
        view.addSubview(bottomSelectionView)
        topSelectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomSelectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: topSelectionView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: topSelectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: topSelectionView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: topSelectionView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: bottomSelectionView, attribute: .top, relatedBy: .equal, toItem: topSelectionView, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: bottomSelectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: bottomSelectionView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomSelectionView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectionView()
        topSelectionView.delegate = self
        topSelectionView.dataSource = self
        bottomSelectionView.delegate = self
        bottomSelectionView.dataSource = self
    }
}

extension ViewController: SelectionViewDelegate, SelectionViewDataSource {
    func numberOfOption(_ selectionView: SelectionView) -> Int {
        var number = 0
        if selectionView == topSelectionView {
            number = 2
        } else if selectionView == bottomSelectionView {
            number = 3
        }
        return number
    }
    
    func textOnButton(_ selectionView: SelectionView) -> String {
        if selectionView == topSelectionView {
            return "1"
        }
        return "1"
    }
    
    func colorOfUnderLine(_ selectionView: SelectionView) -> UIColor? {
        if selectionView == topSelectionView {
            return .red
        }
        return .red
    }
    
    func colorOfTextOnButton(_ selectionView: SelectionView) -> UIColor? {
        if selectionView == topSelectionView {
            return .red
        }
        return .red
    }
    
    func fontOfTextOnButton(_ selectionView: SelectionView) -> UIFont? {
        if selectionView == topSelectionView {
            return .systemFont(ofSize: 18)
        }
        return .systemFont(ofSize: 18)
    }
    
    
}

