//
//  ViewController.swift
//  AutoLayoutEventCycle
//
//  Created by Hamburger on 2020/1/16.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let circleView = UIView()
    let smallCircleView = UIView()
    let small2CircleView = UIView()
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
    
    func twoSmallCircle() {
        
        smallCircleView.backgroundColor = .green
        
        circleView.addSubview(smallCircleView)
        smallCircleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            smallCircleView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor),
            smallCircleView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ])
                
        //---------------------
        
        small2CircleView.backgroundColor = .blue
        
        circleView.addSubview(small2CircleView)
        small2CircleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            small2CircleView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor),
            small2CircleView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        smallWidth = circleView.frame.size.width / 2
        NSLayoutConstraint.activate([
            smallCircleView.widthAnchor.constraint(equalToConstant: smallWidth),
            smallCircleView.heightAnchor.constraint(equalToConstant: smallWidth)
        ])
        
        NSLayoutConstraint.activate([
            small2CircleView.widthAnchor.constraint(equalToConstant: smallWidth),
            small2CircleView.heightAnchor.constraint(equalToConstant: smallWidth)
        ])
        
        smallCircleView.layer.cornerRadius = smallWidth / 2
        small2CircleView.layer.cornerRadius = smallWidth / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        theBiggestCircle()
        twoSmallCircle()
        // Do any additional setup after loading the view.
    }


}

