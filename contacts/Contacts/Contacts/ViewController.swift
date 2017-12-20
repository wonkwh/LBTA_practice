//
//  ViewController.swift
//  Contacts
//
//  Created by kwanghyun.won. on 2017. 12. 20..
//  Copyright © 2017년 kwanghyun.won. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellID = "cellID"
    //let heroNames = ["kwanghyun", "jihoon", "wonhee", "sunghun"]
    //let anotherHeroNames = ["parkjin", "sengwoo", "hyungeun"]

    let twoDimentionalArray = [
        ["kwanghyun", "jihoon", "wonhee", "sunghun"],
        ["parkjin", "sengwoo", "hyungeun"],
        ["lee", "lee2"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Contacts"
        navigationController?.navigationBar.barTintColor = .red

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = (section == 0) ? "Heroes" : "Another Heroes"
        label.backgroundColor = .gray
        return label
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimentionalArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimentionalArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let name = twoDimentionalArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(name) section:\(indexPath.section) row:\(indexPath.row)"
        return cell
    }
}
