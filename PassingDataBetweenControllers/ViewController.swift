//
//  ViewController.swift
//  PassingDataBetweenControllers
//
//  Created by Nilesh Kumar on 03/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    let data = [
        ["Apple", "Mango", "Grapes", "Guava"],
        ["One", "Two", "Three", "Four"],
        ["Mon", "Tue", "Wed", "Thu"],
        ["Summer", "Winter", "Autmn", "Rain"],
        ["India", "Canada", "Sweden", "Russia"]
        
    ]
    
    private let table: UITableView = {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemList = data[indexPath.section]
        let selctedItem = data[indexPath.section][indexPath.row]
        let vc = SecondViewController(selectedItem: selctedItem, itemsList: itemList)
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
}
