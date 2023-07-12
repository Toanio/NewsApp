//
//  HeaderCell.swift
//  NewsApp
//
//  Created by c.toan on 20.12.2022.
//

import UIKit

class HeaderCovidBannerButton: UICollectionReusableView {
    
    let mainLabel:UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Covid-19 News:", attributes: [.foregroundColor: UIColor.blue])
        
        attributedText.append(NSAttributedString(string: " See the latest coverage about Covid-19", attributes: [.foregroundColor: UIColor.black]))
        label.numberOfLines = 0
        label.attributedText = attributedText
        return label
    }()
    
    let chevrone: UILabel = {
        let label = UILabel()
        label.text = ">"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCovidButton()
    }
    
     func setupCovidButton(){
        let viewMain = UIView()
        viewMain.layer.borderWidth = 1
        viewMain.layer.cornerRadius = 8
        viewMain.layer.borderColor = UIColor.gray.cgColor
        viewMain.backgroundColor = .white
        
        let stacView = UIStackView(arrangedSubviews: [
            mainLabel,
            chevrone
        ])
        stacView.spacing = 4
        viewMain.addSubview(stacView)
        stacView.fillSuperview(padding: .init(top: 10, left: 19, bottom: 0, right: 11))
        
        stacView.alignment = .center
        
        addSubview(viewMain)
        viewMain.fillSuperview(padding: .init(top: 27, left: 27, bottom: 27, right: 27))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
}
