//
//  TableViewCellModel.swift
//  ito
//
//  Created by Kostya Lee on 11/04/22.
//

import UIKit

struct TableViewCellModel {
    let title: String
    let vc: UIViewController?
    let icon: String?
    
    init(_ title: String, _ icon: String? = nil, _ vc: UIViewController? = nil) {
        self.title = title
        self.icon = icon
        self.vc = vc
    }
}
