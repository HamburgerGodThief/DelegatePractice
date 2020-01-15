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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? SecondViewController else { return }
//        secondViewController.delegate = self
        secondViewController.textHandler = { (textField) in
            guard let text = textField.text else { return }
            self.labelText.append(text)
            self.tableView.reloadData()
        }
        guard let sender = sender as? IndexPath else { return }
        secondViewController.indexPath = sender
        secondViewController.textField.text = labelText[sender.row]
        secondViewController.passBack = { (textField) in
            guard let indexPath = secondViewController.indexPath else { return }
            guard let cell = self.tableView.cellForRow(at: indexPath) as? TableCell else { return }
            cell.label.text = secondViewController.textField.text
        }
    }
    
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
//        cell.deleteHandler = { (cell) in
//            self.labelText.remove(at: indexPath.row)
//            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
//            tableView.reloadData()
//        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PopSecondVC", sender: indexPath)
    }

}

extension ViewController: TableCellDelegate {
    
    func pass(_ tableCell: TableCell) {
        guard let indexPath = tableView.indexPath(for: tableCell) else { return }
        labelText.remove(at: indexPath.row)
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
    }
    
}

//extension ViewController: SecondViewControllerDelegate {
//
//    func passAndCreate(_ secondViewController: SecondViewController) {
//        guard let textFromTextField = secondViewController.textField.text else { return }
//        labelText.append(textFromTextField)
//        tableView.reloadData()
//    }
//
//    func passBackToVC(_ secondViewController: SecondViewController) {
//        guard let indexPath = secondViewController.indexPath else { return }
//        guard let cell = tableView.cellForRow(at: indexPath) as? TableCell else { return }
//        cell.label.text = secondViewController.textField.text
//    }
//
//}
