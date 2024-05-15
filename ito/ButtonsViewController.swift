//
//  ButtonsViewController.swift
//  ito
//
//  Created by Kostya Lee on 03/06/22.
//

import UIKit

class ButtonsViewController: UIViewController {
    var plainButton: UIButton!
    var grayButton: UIButton!
    var filledRoundedButton: UIButton!
    var capsuleGrayButton: UIButton!
    var tintedImageButton: UIButton!
    var filledButton: UIButton!
    var roundedButton: UIButton!
    var tintedCapsuleButton: UIButton!
    var filledImageButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButtons()
        
    }
    
    func setupButtons() {
        
        let stackOne = UIStackView()
        let stackTwo = UIStackView()
        let stackThree = UIStackView()
        let stackFour = UIStackView()
        let stack = UIStackView(arrangedSubviews: [stackOne, stackTwo, stackThree, stackFour])
        stack.frame = UIScreen.main.bounds
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .leading
        
        [stackOne, stackTwo, stackThree, stackFour].forEach {
            $0.axis = .horizontal
            $0.spacing = 30
            stack.addSubview($0)
        }
        view.addSubview(stack)
        
        
        plainButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 60))
        plainButton.configuration = .plain()
        plainButton.configuration?.title = "Button"
        
        grayButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 60))
        grayButton.configuration = .gray()
        grayButton.configuration?.title = "Purchase"
        
        stackOne.addSubview(plainButton)
        stackOne.addSubview(grayButton)
        
        filledRoundedButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        filledRoundedButton.configuration = .filled()
        filledRoundedButton.configuration?.image = UIImage(systemName: "book.fill")
        filledRoundedButton.configuration?.cornerStyle = .large
         
        capsuleGrayButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        capsuleGrayButton.configuration = .gray()
        capsuleGrayButton.configuration?.cornerStyle = .capsule
        capsuleGrayButton.configuration?.title = "capsule"
        
        stackTwo.addSubview(filledRoundedButton)
        stackTwo.addSubview(capsuleGrayButton)
         
        tintedImageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        tintedImageButton.configuration = .tinted()
        tintedImageButton.configuration?.image = UIImage(systemName: "eye")
        tintedImageButton.configuration?.title = "watch"
        tintedImageButton.configuration?.imagePadding = 6
        tintedImageButton.configuration?.cornerStyle = .medium
        
        filledButton = UIButton(frame: CGRect(x: 20, y: 130, width: 100, height: 70))
        filledButton.configuration = .filled()
        filledButton.configuration?.baseBackgroundColor = .systemPink
        filledButton.configuration?.title = "Buy"
        filledButton.configuration?.cornerStyle = .medium
        
        stackThree.addSubview(tintedImageButton)
        stackThree.addSubview(filledButton)
        
        roundedButton = UIButton(frame: CGRect(x: 20, y: 90, width: 60, height: 60))
        roundedButton.configuration = .tinted()
        roundedButton.configuration?.image = UIImage(systemName: "music.note")
        roundedButton.layer.cornerRadius = roundedButton.frame.height * 0.5
        roundedButton.clipsToBounds = true
        
        tintedCapsuleButton = UIButton(frame: CGRect(x: 20, y: 160, width: 110, height: 55))
        tintedCapsuleButton.configuration = .tinted()
        tintedCapsuleButton.configuration?.cornerStyle = .capsule
        tintedCapsuleButton.configuration?.title = "play"
        
        stackFour.addSubview(roundedButton)
        stackFour.addSubview(tintedCapsuleButton)
        
        filledImageButton = UIButton(frame: CGRect(x: 20, y: 200, width: 110, height: 55))
        filledImageButton.configuration = .filled()
        filledImageButton.configuration?.cornerStyle = .small
        filledImageButton.configuration?.imagePadding = 6
        filledImageButton.configuration?.image = UIImage(systemName: "chart.xyaxis.line")
        filledImageButton.configuration?.baseBackgroundColor = .darkGray
        filledImageButton.configuration?.title = "analyze"
        
        stack.addSubview(filledImageButton)
        
        [plainButton, grayButton, filledRoundedButton, capsuleGrayButton,
         tintedImageButton, filledButton, roundedButton, tintedCapsuleButton,
         filledImageButton].forEach {
            view.addSubview($0)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
    }
    
}
