//
//  ExampleTableViewCell.swift
//  ito
//
//  Created by Kostya Lee on 21/04/22.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {
    
    static let id = "ExampleCell"
    
    var timeLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: 225, height: 20.5))
        label.textColor = .red
        label.text = "Posted time"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    var authorLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 20, y: 21.5, width: 270, height: 23))
        label.textColor = .label
        label.text = "Who posted"
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        return label
    }()

    var contentLabel: UILabel! = {
        // 39
        let label = UILabel(frame: CGRect(x: 20, y: 45.5, width: 270, height: 16))
        label.textColor = .label
//        label.text = "0-3 lines of text"
        label.text = "A clean and lightweight progress HUD for your iOS and tvOS app. - GitHub - SVProgressHUD/SVProgressHUD: A clean and lightweight progress HUD for your iOS and tvOS app"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var viewsLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 20, y: 61.5, width: 150, height: 16))
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "2034 views"
        label.textColor = .label
        return label
    }()
    
    var eventImageView: UIImageView! = {
        let image = UIImageView(frame: CGRect(x: 300, y: 0, width: 110, height: 70))
        image.backgroundColor = .systemGray3
        image.layer.cornerRadius = 12
        return image
    }()
    
    var saveButton: UIButton! = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 31))
        button.imageView?.image = UIImage(systemName: "bookmark.png")
        button.tintColor = .link
        return button
    }()
    
    var subButton: UIButton! = {
        let button = UIButton(frame: CGRect(x: 45, y: 0, width: 44, height: 31))
        button.imageView?.image = UIImage(systemName: "person.crop.circle.badge.plus.png")
        button.tintColor = .link
        return button
    }()
    
    var buttons: UIView! = {
        let view = UIView()
        let saveButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 31))
        saveButton.imageView?.image = UIImage(systemName: "bookmark.png")
        saveButton.tintColor = .link
        let subButton = UIButton(frame: CGRect(x: 45, y: 0, width: 44, height: 31))
        subButton.imageView?.image = UIImage(systemName: "person.crop.circle.badge.plus.png")
        subButton.tintColor = .link
        view.addSubview(saveButton)
        view.addSubview(subButton)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupConstraints()
//        timeLabel.text = "Today at 10:30"
//        authorLabel.text = "The British Council"
//        contentLabel.text = "A clean and lightweight progress HUD for your iOS and tvOS app. - GitHub - SVProgressHUD/SVProgressHUD: A clean and lightweight progress HUD for your iOS and tvOS app"
//        viewsLabel.text = "8 023"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupConstraints() {
        self.addSubview(timeLabel)
        self.addSubview(authorLabel)
        self.addSubview(contentLabel)
        self.addSubview(viewsLabel)
        if UIScreen.main.bounds.width >= 400 {
            self.addSubview(eventImageView)
            self.addSubview(saveButton)
            self.addSubview(subButton)
        }
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            timeLabel.widthAnchor.constraint(equalToConstant: 225),
            timeLabel.heightAnchor.constraint(equalToConstant: 20.5),

            authorLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            authorLabel.widthAnchor.constraint(equalToConstant: 270),
            authorLabel.heightAnchor.constraint(equalToConstant: 23),

            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            contentLabel.widthAnchor.constraint(equalToConstant: 270),
            contentLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 37),
            
            viewsLabel.widthAnchor.constraint(equalToConstant: 150),
            viewsLabel.heightAnchor.constraint(equalToConstant: 16),
            viewsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewsLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor)
        ])
        contentLabel.sizeToFit()
                
    }
}
