//
//  HomeController.swift
//  ito
//
//  Created by Kostya Lee on 16/05/22.
//

import UIKit

class HomeController: UICollectionViewController, HomePostCellDelegate {
    
    func didTapComment(post: Post) {}
    func didLike(for cell: HomePostCell) {}
    
    let cellId = "cellId"
    
    let refreshControl = UIRefreshControl()
    var fetchingMore = false
    var endReached = false
    let leadingScreenForBatching:CGFloat = 2
    let loadingPhotosQueue = OperationQueue()
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .systemBackground
        collectionView?.register(HomePostCell.self,
                                 forCellWithReuseIdentifier: cellId)
        setupDMbarbuttomItem()
        setupNavigationItems()
    }
    
    private func setupDMbarbuttomItem () {
        let button = UIBarButtonItem(image: UIImage(systemName: "paperplane")?.withTintColor(.label, renderingMode: .alwaysOriginal),
                                     style: .plain,
                                     target: self,
                                     action: #selector(showDMController))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func showDMController() {}
    
    private var startKey:String?
    
    func setupNavigationItems() {
        let image = UIImage(systemName: "arrow.down")
        let tintImage = image?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: tintImage)
                                  imageView.tintColor = .label
        navigationItem.titleView = imageView
    }

}

// MARK:- UICollectionViewDelegateFlowLayout
extension HomeController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let commentString = "Comment"
        let estimateHeight = commentString.getEdtimatedHeight(width: view.frame.width)
        var height: CGFloat = 40 + 8 + 8 //username and userProfileImageView
        height += view.frame.width
        height += 50
        height += 60
        height += estimateHeight
        return CGSize(width: view.frame.width, height: height)
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as! HomePostCell
        if !self.refreshControl.isRefreshing {
            let user = User(uid: "UUIDdefaultUser", dictionary: [:])
            cell.post = Post(user: user, dictionary: ["qwerty" : 12])
        }
        cell.delegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didEndDisplaying cell: UICollectionViewCell,
                                 forItemAt indexPath: IndexPath) {
        
    }

}
