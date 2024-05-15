//
//  SimpleTableViewController.swift
//  ito
//
//  Created by Kostya Lee on 21/04/22.
//

import UIKit

class SimpleTableViewController: TableOfOptionsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleCell")
        
        for number in 1..<21 {
            options.append(TableViewCellModel("\(number)"))
        }
    }
}

extension SimpleTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell")!
        cell.textLabel?.text = options[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
}
