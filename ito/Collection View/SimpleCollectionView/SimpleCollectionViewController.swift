//
//  SimpleCollectionViewController.swift
//  ito
//
//  Created by Kostya Lee on 08/05/22.
//

import UIKit

class SimpleCollectionViewController: UICollectionViewController {
    
    static let shared = SimpleCollectionViewController()
    
    var columns: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(SliderCell.self, forCellWithReuseIdentifier: SliderCell.cellID)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateColumnsWhenSliderValueChanged(_ items: Int) {
        self.columns = items
        collectionView.reloadData()
    }
}

extension SimpleCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 60
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if indexPath.section == 0 {
            var sCell = SliderCell()
            sCell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.cellID, for: indexPath) as! SliderCell
            sCell.frame = CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 80)
            return sCell
        }
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) 
        cell.backgroundColor = .link
        
        return cell
    }
}

extension SimpleCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width - 30, height: 100)
        }
        let itemsPerRow: CGFloat = CGFloat(columns)
        let paddingWidth = 17 * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingWidth
        let itemSize = availableWidth / itemsPerRow
        return CGSize(width: itemSize, height: itemSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }

}
