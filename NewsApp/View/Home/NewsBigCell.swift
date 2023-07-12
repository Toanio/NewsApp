//
//  NewsBigCell.swift
//  NewsApp
//
//  Created by c.toan on 22.12.2022.
//

import UIKit

class NewsBigCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.constrainHeight(constant: 130)
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Top News"
        label.numberOfLines = 0
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 hour"
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        imageView.layer.cornerRadius = 16
        let stackView = VerticalStackView(arrangedSubviews: [
            imageView,
            nameLabel,
            timeLabel
       ])
        stackView.spacing = 2
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 8 , left: 27, bottom: 8, right: 25))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

