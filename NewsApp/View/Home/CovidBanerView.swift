//
//  CovidBanerView.swift
//  NewsApp
//
//  Created by c.toan on 16.11.2022.
//

import UIKit

class CovidBanerView: UIView {

    let mainLabel:UILabel = {
        let label = UILabel()
        label.text = "Covid-19 News : See the latest coverage about Covid-19"
        return label
    }()
    
    let chevrone = UIImage(named: "chevron.right")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(mainLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
