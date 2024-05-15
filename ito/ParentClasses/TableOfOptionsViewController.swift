//
//  TableOfOptionsViewController.swift
//  ito
//
//  Created by Kostya Lee on 11/04/22.
//

import UIKit

class TableOfOptionsViewController: UITableViewController {

    var options = [TableViewCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    fileprivate func configureTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
}


extension TableOfOptionsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = options[indexPath.row].vc else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
