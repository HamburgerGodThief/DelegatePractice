//
//  ViewController.swift
//  PassValue
//
//  Created by Hamburger on 2020/1/15.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let labelText = ["2", "3", "4", "5"]
    var indexPathAtVC = [IndexPath]()
    
    func setNavigationItem() {
        let leftButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(popSecondVC(sender:)))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func popSecondVC(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "PopSecondVC", sender: nil)
    }
    
    @objc func deleteCell(sender: UIButton) {
        tableView.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        setNavigationItem()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else { return UITableViewCell()}
        indexPathAtVC.append(indexPath)
        cell.label.text = labelText[indexPath.row]
        
        cell.button.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PopSecondVC", sender: nil)
    }

}
