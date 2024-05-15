//
//  SliderCell.swift
//  ito
//
//  Created by Kostya Lee on 13/05/22.
//

import UIKit

class SliderCell: UICollectionViewCell {
    static let cellID = "SliderCell"
    
    fileprivate var slider: UISlider = {
        let slider = UISlider(frame: .init(x: 15, y: 0, width: 200, height: 50))
        return slider
    }()
    
    fileprivate var hintLabel: UILabel = {
        let label = UILabel(frame: .init(x: 0, y: 0, width: 150, height: 40))
        label.text = "Items per row: "
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    fileprivate var indicatorLabel: UILabel = {
        let label = UILabel(frame: .init(x: 0, y: 0, width: 50, height: 40))
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "1"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSlider()
        self.addSubview(slider)
        self.addSubview(hintLabel)
        self.addSubview(indicatorLabel)
        setSliderConstraints()
        setLabelConstraints()
    }
    
    fileprivate func configureSlider() {
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.frame = CGRect(x: 15, y: 0, width: UIScreen.main.bounds.width - 30, height: 50)
        
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
    }
    
    fileprivate func setSliderConstraints() {
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: self.topAnchor),
            slider.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            slider.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 20),
            slider.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }

    fileprivate func setLabelConstraints() {
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        indicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hintLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            hintLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            indicatorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
            indicatorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider) {
        indicatorLabel.text = String(Int(sender.value))
        SimpleCollectionViewController.shared.updateColumnsWhenSliderValueChanged(Int(sender.value))
    }
    
    
    required init?(coder aCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
