//
//  TableViewControllers.swift
//  ito
//
//  Created by Kostya Lee on 21/04/22.
//

import UIKit

class TableViewControllers: TableOfOptionsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
        options = [
            TableViewCellModel("Simple", nil, SimpleTableViewController()),
            TableViewCellModel("Example", nil, ExampleTableViewController())
        ]
    }

}

extension TableViewControllers {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell")!
        cell.textLabel?.text = options[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(options[indexPath.row].vc!, animated: true)
        
    }
}
