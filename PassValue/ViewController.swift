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
    var labelText = ["2", "3", "4", "5"]
    
    
    func setNavigationItem() {
        let leftButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(popSecondVC(sender:)))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func popSecondVC(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "PopSecondVC", sender: nil)
    }
    
//    @objc func removeCell(sender: UIButton) {
//        guard let specificCell = sender.superview?.superview as? TableCell else { return }
//        guard let indexPath = tableView.indexPath(for: specificCell) else { return }
//        labelText.remove(at: indexPath.row)
//        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
//        tableView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
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
        cell.label.text = labelText[indexPath.row]
        //cell.button.addTarget(self, action: #selector(removeCell(sender:)), for: .touchUpInside)
        cell.deleteHandler = { (cell) in
            self.labelText.remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
            tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PopSecondVC", sender: nil)
    }

}
