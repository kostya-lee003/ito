//
//  ExampleTableViewController.swift
//  ito
//
//  Created by Kostya Lee on 21/04/22.
//

import UIKit

class ExampleTableViewController: UITableViewController {
    
    let timeLabelTexts = ["Today at 10:30", "Tomorrow at 15:00", "On Friday at 9:30", "Tomorrow at 7:00", "on Wednesday at 16:00", "on Monday at 11:00", "on Friday at 10:00", "Today at 6 pm", "Today at 12:00"]
    let authorLabelTexts = ["The British Council", "The Avito", "The LDRRF", "My company", "The Gorilla", "Marvel Studios", "The Big Hit", "The end", "Lolipop"]
    let contents = ["A clean and lightweight progress HUD for your iOS and tvOS app. - GitHub - SVProgressHUD/SVProgressHUD: A clean and lightweight progress HUD for your iOS and tvOS app",
    "Millions of developers and companies build, ship, and maintain their software on GitHub—the largest and most advanced development platform in the world.",
    "Simple SwiftUI is a small but growing collection of iOS projects designed to provide small sample projects for SwiftUI learners to read, learn from, modify, and even use as a basis for their projects in the future.",
    "提示：购买链接在页面最下方，购买企微token，我们免费赠送为期一年的句客宝的SCRM功能",
    "Welcome the curious about the Swift programming language.",
    "Highlight community driven initiatives and technical work that have broad applicability to Swift users in all or some of its core usage domains.",
    "🚀 Supporting request forwarding and Promise based HTTP client for all JavaScript runtimes.",
    "A drop-in substitute for the browser native localStorage API that runs on node.js.",
    "Example Vue.js website demonstrating how to listen to the Binance Websocket server and trade charts using d3.js."
    ]
    let viewsLabelTexts = ["8023 views", "130 views", "480 views", "9200 views", "3000 views", "5550 views", "12230 views", "129 views", "3100 views"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: "ExampleCell")
        navigationItem.title = "Upcoming events"
    }
}

extension ExampleTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.id) as! ExampleTableViewCell
        cell.timeLabel.text = timeLabelTexts[indexPath.row]
        cell.authorLabel.text = authorLabelTexts[indexPath.row]
        cell.contentLabel.text = contents[indexPath.row]
        cell.viewsLabel.text = viewsLabelTexts[indexPath.row]
        
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        authorLabelTexts.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        128
    }
}
