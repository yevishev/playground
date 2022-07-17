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
        super.init(frame: CGRect(x: 10, y: 20, width: 400, height: 400))
        
        let searchTextField = UITextField(frame: CGRect(x: 10, y: 20, width: 400, height: 500))
        searchTextField.backgroundColor = .systemPink
        self.searchTextField = searchTextField
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("IB is not supported")
    }
}
