//
//  NewsCell.swift
//  NewsApp
//
//  Created by c.toan on 16.12.2022.
//

import UIKit

class NewsCell: UICollectionViewCell {
    var newsData: News! {
        didSet {
            imageView.sd_setImage(with: URL(string: newsData.image_url))
            nameLabel.text = newsData.title
            timeLabel.text = newsData.published_at
        }
    }
    var mode: Mode = .small
    
    enum Mode {
        case small, big
        
    }
   
    
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.constrainWidth(constant: 85)
        image.constrainHeight(constant: 85)
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Top News"
        label.numberOfLines = 2
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
        
        
        let stackView = UIStackView(arrangedSubviews: [
            VerticalStackView(arrangedSubviews: [nameLabel, timeLabel]),
            imageView,
        ])
        stackView.spacing = 10
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 8 , left: 27, bottom: 8, right: 25))
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
