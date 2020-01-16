//
//  ViewController.swift
//  AutoLayoutEventCycle
//
//  Created by Hamburger on 2020/1/16.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let circleView = CustomView()
    
    var width = CGFloat()
    var smallWidth = CGFloat()
    
    func theBiggestCircle() {
        width = view.frame.size.width / 2
        circleView.backgroundColor = .red
        
        view.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: width),
            circleView.heightAnchor.constraint(equalToConstant: width)
        ])
        circleView.layer.cornerRadius = width / 2
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        smallWidth = circleView.frame.size.width / 2
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        theBiggestCircle()
        // Do any additional setup after loading the view.
    }


}

