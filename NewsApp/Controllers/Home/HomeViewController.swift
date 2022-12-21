//
//  HomeViewController.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit
import SDWebImage

class HomeViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let headerID = "headerID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: cellId )
        collectionView.register(HeaderCovidBannerButton.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        
        fetchData()
    }
    
    @objc private func handleTest() {
        print("Hey!")
    }
    private func setupViews() {
        createCustomNavigationBar()
        let customTitleView = createCustomTitleView(title: "NEWS", logoImage1: "mainLogo")
        navigationItem.titleView = customTitleView
    }
    
    var newsResult = [News]()
    
    private func fetchData() {
        APICaller.shared.fetchTopNews { result, error in
            if let error = error {
                print("Failed to fetch app", error)
                return
            }
            self.newsResult = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCell
        let result = newsResult[indexPath.item]
        cell.nameLabel.text = result.title
        cell.imageView.sd_setImage(with: URL(string: result.image_url))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }
   
}
