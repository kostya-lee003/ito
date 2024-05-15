//
//  OnboardingViewController.swift
//  ito
//
//  Created by Kostya Lee on 09/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var body2Label: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 41 / 255, green: 42 / 255, blue: 48 / 255, alpha: 100)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tapRecognizer)
        tapRecognizer.delegate = self
        
        setupLabels()
        
        if UIScreen.main.bounds.width >= 400 {
            print(">")
        }
    }
    
    func setupLabels() {
        descriptionLabel.textColor = UIColor(red: 137 / 255, green: 220 / 255, blue: 251 / 255, alpha: 1)
        bodyLabel.textColor = UIColor(red: 223 / 255, green: 223 / 255, blue: 224 / 255, alpha: 1)
        body2Label.textColor = UIColor(red: 212 / 255, green: 187 / 255, blue: 250 / 255, alpha: 1)
        instructionsLabel.textColor = UIColor(red: 129 / 255, green: 140 / 255, blue: 151 / 255, alpha: 1)
    }
    
    @objc private func didTap() {
        let navigationC = UINavigationController(rootViewController: ListOfViewsViewController())
        navigationC.modalPresentationStyle = .fullScreen
        navigationC.modalTransitionStyle = .crossDissolve
        present(navigationC, animated: true, completion: nil)
    }

}

extension OnboardingViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.superview!.superclass! .isSubclass(of: UIButton.self) {
            return false
        }
        return true
    }
}
