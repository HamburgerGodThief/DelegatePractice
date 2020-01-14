//
//  ViewController.swift
//  GCDPractice
//
//  Created by Hamburger on 2020/1/14.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topRoadLabel: UILabel!
    @IBOutlet weak var topSpeedLabel: UILabel!
    @IBOutlet weak var midRoadLabel: UILabel!
    @IBOutlet weak var midSpeedLabel: UILabel!
    @IBOutlet weak var bottomRoadLabel: UILabel!
    @IBOutlet weak var bottomSpeedLabel: UILabel!
    @IBOutlet weak var semaphoreTopRoad: UILabel!
    @IBOutlet weak var semaphoreTopSpeed: UILabel!
    @IBOutlet weak var semaphoreMidRoad: UILabel!
    @IBOutlet weak var semaphoreMidSpeed: UILabel!
    @IBOutlet weak var semaphoreBottomRoad: UILabel!
    @IBOutlet weak var semaphoreBottomSpeed: UILabel!
    
    let taipeiProvider = TaipeiProvider()
    var firstResponseResult = [TaipeiViolation]()
    var secondResponseResult = [TaipeiViolation]()
    var thirdResponseResult = [TaipeiViolation]()
    let queue = DispatchQueue(label: "Concurrent Queue", attributes: .concurrent)
    let group = DispatchGroup()
    
    var semaphoreResponse: [[String: String]] = []
    let queueConcurrent = DispatchQueue(label: "Concurrent Queue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 1)
    
    func first() {
        taipeiProvider.fetchFirst(completion: { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                self?.firstResponseResult = response.result.results
                self?.group.leave()
                
            case .failure:
                
                print("text: 讀取資料失敗！")
            }
        })
    }
    
    func second() {
        taipeiProvider.fetchSecond(completion: { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                self?.secondResponseResult = response.result.results
                self?.group.leave()
                
            case .failure:
                
                print("text: 讀取資料失敗！")
            }
        })
    }
    
    func third() {
        taipeiProvider.fetchThird(completion: { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                self?.thirdResponseResult = response.result.results
                self?.group.leave()
                
            case .failure:
                
                print("text: 讀取資料失敗！")
            }
        })
    }
    
    func buildGroupQueue() {

        group.enter()
        queue.async(group: group) {
            self.first()
//            print("first done")
        }
        
        group.enter()
        queue.async(group: group) {
            
            self.second()
//            print("second done")
        }
        
        group.enter()
        queue.async(group: group) {
            self.third()
//            print("thrid done")
        }
        
        group.notify(queue: .main) {
            self.topRoadLabel.text = self.firstResponseResult[0].road
            self.topSpeedLabel.text = self.firstResponseResult[0].speedLimit
            self.midRoadLabel.text = self.secondResponseResult[0].road
            self.midSpeedLabel.text = self.secondResponseResult[0].speedLimit
            self.bottomRoadLabel.text = self.thirdResponseResult[0].road
            self.bottomSpeedLabel.text = self.thirdResponseResult[0].speedLimit
//            print("All tasks done")
        }
    }
    
    func firstSerial() {
        taipeiProvider.fetchFirst(completion: { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                self?.semaphoreResponse.append(["Road": response.result.results[0].road,
                                                "SpeedLimit": response.result.results[0].speedLimit])
                
            case .failure:
                
                print("text: 讀取資料失敗！")
            }
        })
    }
    
    func secondSerial() {
        taipeiProvider.fetchSecond(completion: { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                self?.semaphoreResponse.append(["Road": response.result.results[0].road,
                                                "SpeedLimit": response.result.results[0].speedLimit])
                
            case .failure:
                
                print("text: 讀取資料失敗！")
            }
        })
    }
    
    func thirdSerial() {
        taipeiProvider.fetchThird(completion: { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                self?.semaphoreResponse.append(["Road": response.result.results[0].road,
                                                "SpeedLimit": response.result.results[0].speedLimit])
                
            case .failure:
                
                print("text: 讀取資料失敗！")
            }
        })
    }
    
    func serialQueue() {
        queueConcurrent.async {
            print("first fetch - wait")
            self.semaphore.wait()
            print("first fetch - wait finish")
            self.firstSerial()
            self.semaphoreTopRoad.text = self.firstResponseResult[0].road
            self.semaphoreTopSpeed.text = self.firstResponseResult[0].speedLimit
            print("first fetch - ing")
            self.semaphore.signal()
            print("first fetch - done")
        }
        
        queueConcurrent.async {
            print("second fetch - wait")
            self.semaphore.wait()
            print("second fetch - wait finish")
            self.secondSerial()
            self.semaphoreMidRoad.text = self.secondResponseResult[0].road
            self.semaphoreMidSpeed.text = self.secondResponseResult[0].speedLimit
            print("second fetch - ing")
            self.semaphore.signal()
            print("second fetch - done")
        }
        
        queueConcurrent.async {
            print("third fetch - wait")
            self.semaphore.wait()
            print("third fetch - wait finish")
            self.thirdSerial()
            self.semaphoreBottomRoad.text = self.thirdResponseResult[0].road
            self.semaphoreBottomSpeed.text = self.thirdResponseResult[0].speedLimit
            print("third fetch - ing")
            self.semaphore.signal()
            print("third fetch - done")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildGroupQueue()
        serialQueue()
        // Do any additional setup after loading the view.
    }

}

