//
//  GifSearchCollectionViewCell.swift
//  Nba.com clone
//
//  Created by oberoya on 17/07/2022.
//

import UIKit

class GifSearchCollectionView: UICollectionReusableView {
    
    weak var searchTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //добавляю поля для текстового ввода
        let searchTextField = UITextField(frame: CGRect(x: 10, y: 10, width: 400, height: 50))
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 6
        searchTextField.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
        searchTextField.layer.borderWidth = 1
        searchTextField.borderStyle = .roundedRect
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.keyboardType = .default
        searchTextField.placeholder = "try find some gif"
        self.searchTextField = searchTextField
        addSubview(searchTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("IB is not supported")
    }
}
