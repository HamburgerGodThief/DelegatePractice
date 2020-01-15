//
//  TableCell.swift
//  PassValue
//
//  Created by Hamburger on 2020/1/15.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
        
    let label: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .orange
        return lbl
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("delete", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    var deleteHandler: ((UITableViewCell) -> Void)?
    
    func setLabel() {
        self.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22),
            NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        ])
    }
    
    func setButton() {
        self.contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22),
            NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        ])
        button.addTarget(self, action: #selector(removeCell(sender:)), for: .touchUpInside)
    }
    
    @objc func removeCell(sender: UIButton) {
        deleteHandler?(self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLabel()
        setButton()
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
