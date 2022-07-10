//
//  CollectionViewTableViewCell.swift
//  Nba.com clone
//
//  Created by oberoya on 10/07/2022.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    var newsImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(newsImageView)
        
        newsImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        newsImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        newsImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


