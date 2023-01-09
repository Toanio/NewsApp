//
//  HeaderView.swift
//  NewsApp
//
//  Created by c.toan on 23.12.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    private let segmentControll: UISegmentedControl = {
        let items = ["Latest", "Indonesia", "Technology", "World"]
        let segment = UISegmentedControl(items: items)
        segment.frame = CGRect(x: 10, y: 150, width: 400, height: 30)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [
            searchBar,
            segmentControll
        ])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
