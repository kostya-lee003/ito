//
//  ListOfViewsViewController.swift
//  ito
//
//  Created by Kostya Lee on 09/04/22.
//

import UIKit

class ListOfViewsViewController: UIViewController {
    
    var tableView: UITableView!
    // Container views
    fileprivate let sectionOne = [TableViewCellModel("Tab bar", "Tab_bar_i", TabBarController())]
    
    // Scroll views
    fileprivate let sectionTwo = [TableViewCellModel("Table view", "table_view_i", TableViewControllers()),
                      TableViewCellModel("Collection view", "collection_view_i", CollectionViewControllers()),
                      TableViewCellModel("Compositional collection view", "comp_collection_view_i", HomeViewController())]
    
    // Views
    fileprivate let sectionThree = [TableViewCellModel("Button", "button_i", ButtonsViewController()),
                        TableViewCellModel("Label", "label_i", SomeViewController()),
                        TableViewCellModel("Text field", "text_field_i", SomeViewController()),
                        TableViewCellModel("Text view", "text_view_i", SomeViewController()),
                        TableViewCellModel("Segmented Control", "picker_i", SomeViewController()),
                        TableViewCellModel("Image view", "image_i", SomeViewController()),
                        TableViewCellModel("Slider", "slider_i", SomeViewController()),
                        TableViewCellModel("Progress view", "progress_i", SomeViewController()),
                        TableViewCellModel("Date picker", "date_picker_i", SomeViewController()),
                        TableViewCellModel("Switch", "switch_i", SomeViewController())]
    
    var sections: [[TableViewCellModel]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [sectionOne, sectionTwo, sectionThree]
        setupNavigationController()
        setupTableView()
    }
    
    fileprivate func setupNavigationController() {
        navigationItem.title = "ito"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setupTableView() {
        self.tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
}

extension ListOfViewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let section = sections[indexPath.section]
        cell.textLabel?.text = section[indexPath.row].title
        cell.imageView?.image = UIImage(named: section[indexPath.row].icon!) 
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        navigationController?.pushViewController(section[indexPath.row].vc!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Container views"
        case 1:
            return "Scroll views"
        case 2:
            return "Views"
        default:
            return ""
        }
    }
}
