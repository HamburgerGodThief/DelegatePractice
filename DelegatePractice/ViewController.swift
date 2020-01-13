//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Hamburger on 2020/1/13.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

struct BtnInfo {
    let title: String
    let color: UIColor
    let font: UIFont
}

class ViewController: UIViewController {
    
    let topSelectionView = SelectionView()
    let bottomSelectionView = SelectionView()
    
    let topColorView = UIView()
    let bottomColorView = UIView()
    
    let topBtn = [BtnInfo(title: "Red", color: .red, font: .systemFont(ofSize: 18)),
                  BtnInfo(title: "Yellow", color: .yellow, font: .systemFont(ofSize: 18))]
    let bottomBtn = [BtnInfo(title: "Red", color: .red, font: .systemFont(ofSize: 18)),
                     BtnInfo(title: "Yellow", color: .yellow, font: .systemFont(ofSize: 18)),
                     BtnInfo(title: "Blue", color: .blue, font: .systemFont(ofSize: 18))]
    
    func setSelectionView() {
        view.addSubview(topSelectionView)
        view.addSubview(bottomSelectionView)
        topSelectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomSelectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: topSelectionView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: topSelectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: topSelectionView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: topSelectionView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: bottomSelectionView, attribute: .top, relatedBy: .equal, toItem: topSelectionView, attribute: .bottom, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: bottomSelectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: bottomSelectionView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomSelectionView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
    }
    func setView() {
        view.addSubview(topColorView)
        view.addSubview(bottomColorView)
        topColorView.translatesAutoresizingMaskIntoConstraints = false
        bottomColorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: topColorView, attribute: .top, relatedBy: .equal, toItem: topSelectionView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: topColorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: topColorView, attribute: .leading, relatedBy: .equal, toItem: topSelectionView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: topColorView, attribute: .trailing, relatedBy: .equal, toItem: topSelectionView, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: bottomColorView, attribute: .top, relatedBy: .equal, toItem: bottomSelectionView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomColorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: bottomColorView, attribute: .leading, relatedBy: .equal, toItem: bottomSelectionView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomColorView, attribute: .trailing, relatedBy: .equal, toItem: bottomSelectionView, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        topColorView.backgroundColor = .red
        bottomColorView.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setSelectionView()
        setView()
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
            number = topBtn.count
        } else if selectionView == bottomSelectionView {
            number = bottomBtn.count
        }
        return number
    }
    
    func textOnButton(_ selectionView: SelectionView, buttonForNumber: Int) -> String {
        if selectionView == topSelectionView {
            return topBtn[buttonForNumber].title
        }
        return bottomBtn[buttonForNumber].title
    }
    
    func colorOfUnderLine(_ selectionView: SelectionView) -> UIColor {
        if selectionView == topSelectionView {
            return .white
        }
        return .white
    }
    
    func colorOfTextOnButton(_ selectionView: SelectionView, buttonForNumber: Int) -> UIColor {
        if selectionView == topSelectionView {
            return topBtn[buttonForNumber].color
        }
        return bottomBtn[buttonForNumber].color
    }
    
    func fontOfTextOnButton(_ selectionView: SelectionView, buttonForNumber: Int) -> UIFont {
        if selectionView == topSelectionView {
            return topBtn[buttonForNumber].font
        }
        return bottomBtn[buttonForNumber].font
    }
    
    func buttonIsEnable(_ selectionView: SelectionView, didSelectButtonAt: Int) {
        if selectionView == topSelectionView {
            topColorView.backgroundColor = topBtn[didSelectButtonAt].color
        } else {
            bottomColorView.backgroundColor = bottomBtn[didSelectButtonAt].color
        }
    }
    
    func buttonIsDisable(_ selectionView: SelectionView, didSelectButtonAt: Int) {
        if selectionView == topSelectionView && didSelectButtonAt == topSelectionView.arrayButton.count - 1 {
            for btn in bottomSelectionView.arrayButton {
                btn.isEnabled = false
            }
        } else {
            for btn in bottomSelectionView.arrayButton {
                btn.isEnabled = true
            }
        }
    }
}
