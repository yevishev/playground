//
//  GifCollectionViewCell.swift
//  Nba.com clone
//
//  Created by oberoya on 14/07/2022.
//

import UIKit

class GifCollectionViewCell: UICollectionViewCell {

    let cellLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
    
    func setCellLabelText(_ labelText: String) {
        cellLabel.text = labelText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
