//
//  CollectionViewControllers.swift
//  ito
//
//  Created by Kostya Lee on 13/05/22.
//

import UIKit

class CollectionViewControllers: TableOfOptionsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Collection views"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
        options = [TableViewCellModel(
            "Simple collection view", nil, SimpleCollectionViewController.shared
        ),
        TableViewCellModel(
            "Instagram page example", nil, HomeController()
        )]
    }
}

extension CollectionViewControllers {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell")!
        cell.textLabel?.text = options[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(options[indexPath.row].vc!, animated: true)
    }
}
