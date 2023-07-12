//
//  Extension + UIViewController.swift
//  NewsApp
//
//  Created by c.toan on 20.12.2022.
//

import UIKit

extension UIViewController {
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
    }
    
    func createCustomTitleView(title: String, logoImage1: String?) -> UIView {
        let view = UIView()
        view.fillSuperview()
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.frame = CGRect(x: 105, y: 4, width: 220, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(titleLabel)
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: logoImage1 ?? "")
        logoImage.clipsToBounds = true
        logoImage.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        view.addSubview(logoImage)
        return view
    }
}
