//
//  TopNewsTableViewCell.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit

class TopNewsTableViewCell: UITableViewCell {

   static let identifier = "TopNewsTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test some topic of news"
       //TODO: - Сделать перенос строки?
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12 minutes"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Tech"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(titlePosterImage)
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27)
        ]
        
        let timeLabelConstraints = [
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ]
        
        let categoryLabelConstraints = [
            categoryLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 15),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ]
        
        let titlePosterImageConstraints = [
            titlePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            titlePosterImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 50),
            titlePosterImage.widthAnchor.constraint(equalToConstant: 100),
            titlePosterImage.heightAnchor.constraint(equalToConstant: 100)
                                                 
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(timeLabelConstraints)
        NSLayoutConstraint.activate(categoryLabelConstraints)
        NSLayoutConstraint.activate(titlePosterImageConstraints)
    }
    
}
