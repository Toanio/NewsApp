//
//  SearchViewController.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .default
        return controller
        
    }()
    
    private let segmentControll: UISegmentedControl = {
        
        let items = ["Latest", "Indonesia", "Technology", "World"]
        let segment = UISegmentedControl(items: items)
        segment.frame = CGRect(x: 10, y: 150, width: 400, height: 30)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changeSegment( _:)), for: .valueChanged)
        return segment
    }()
    
    let textLabel = UILabel(frame: CGRect(x: 30, y: 500, width: 400, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.searchController = searchController
        view.addSubview(segmentControll)
        view.addSubview(textLabel)

        
    }
    
    @objc func changeSegment(_ sender: UISegmentedControl!) {
        switch sender.selectedSegmentIndex {
        case 0:
            textLabel.text = "Hello"
        case 1:
            textLabel.text = "Man"
        case 2:
            textLabel.text = "Good"
        case 3:
            textLabel.text = "Fan"
        default:
            textLabel.text = "Alrm!"
        }
    }
    



}
