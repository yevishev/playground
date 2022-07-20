//
//  GifSearchCollectionViewCell.swift
//  Nba.com clone
//
//  Created by oberoya on 17/07/2022.
//

import UIKit

class GifSearchCollectionViewCell: UICollectionViewCell {
    
    weak var searchTextField: UITextField!
    var textValueSearch: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //добавляю поля для текстового ввода
        let searchTextField = UITextField(frame: CGRect(x: 5, y: 5, width: 300, height: 50))
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 6
        searchTextField.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
        searchTextField.layer.borderWidth = 1
        searchTextField.borderStyle = .roundedRect
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.keyboardType = .default
        searchTextField.placeholder = "try find some gif"
        searchTextField.delegate = self
        self.searchTextField = searchTextField
        addSubview(searchTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("IB is not supported")
    }
}

extension GifSearchCollectionViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: string) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            self.textValueSearch = updatedText
        }
        return true
    }
}
