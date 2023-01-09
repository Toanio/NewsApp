//
//  SearchViewController.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit
import SnapKit


class SearchViewController: BaseListController, UICollectionViewDelegateFlowLayout{

    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .medium)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let segmentControll: UISegmentedControl = {
        let items = ["Latest", "Indonesia", "Technology", "World"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(changeSegment(_:)), for: .valueChanged)
        return segment
    }()
    
    let labelTest: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let headerId = "headerId"
    let cellId = "cellId"
    
    var newsResult = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupHeaderViews()
        
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
        view.addSubview(searchBar)
        view.addSubview(segmentControll)
        view.addSubview(activityIndicatorView)
        setupConstraints()
        
        fetchFirstResult()
    }
    
    func fetchFirstResult() {
        APICaller.shared.fetchTopNews { result, error in
            if let error = error {
                print("Failed to fetch app", error)
                return
            }
            self.newsResult = result
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCell
        cell.newsData = newsResult[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.left.equalTo(view).inset(0)
            make.size.equalTo(CGSize(width: view.frame.width, height: 50))
        }
        
        segmentControll.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.width, height: 30))
            make.top.equalTo(searchBar.snp_bottomMargin).inset(-8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentControll.snp_bottomMargin).inset(-5)
            make.size.equalTo(CGSize(width: view.frame.width, height: view.frame.height - 100))
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
        
    }
    
    private func setupHeaderViews() {
        createCustomNavigationBar()
        let customTitleView = createCustomTitleView(title: "Headlines", logoImage1: "mainLogo")
        navigationItem.titleView = customTitleView
    }

    var textLabel = UILabel()
    @objc func changeSegment(_ sender: UISegmentedControl!) {
        switch sender.selectedSegmentIndex {
        case 0:
            APICaller.shared.fetchTopNews { results, error in
                if let error = error {
                    print("Failed to fetch app", error)
                    return
                }
                self.newsResult = results
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.collectionView.reloadData()
                }
            }
            
        case 1:
            self.activityIndicatorView.startAnimating()
            APICaller.shared.fetchHeadlines { results, error in
                if let error = error {
                    print("Failed to fetch app", error)
                    return
                }
                
                self.newsResult = results
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.collectionView.reloadData()
                }
            }
        case 2:
            self.activityIndicatorView.startAnimating()
            newsResult = []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        case 3:
            self.activityIndicatorView.startAnimating()
            newsResult = []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        default:
            print("Hello")
        }
    }
    



}
