//
//  GifCollectionViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class GifCollectionViewController: UICollectionViewController {
    
    let data: [String] = [
        "Picture1",
        "Picture2",
        "Picture3",
        "Picture4",
        "Picture5",
        "Picture6",
    ]
    
//    private let searchTextField = UITextField(frame: CGRect(x: 10, y: 100, width: 394, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchTextField.backgroundColor = .white
//        searchTextField.borderStyle = .roundedRect
//        searchTextField.clearButtonMode = .always
//        searchTextField.returnKeyType = .search
//        searchTextField.keyboardType = .default
//        searchTextField.placeholder = "let`s find some gif"
//        searchTextField.delegate = self
        
//        view.backgroundColor = .systemBackground
//        view.addSubview(searchTextField)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return GifCollectionViewCell()
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
////        print(textField.text ?? "undefined")
//        if let text = textField.text, let textRange = Range(range, in: string) {
//            let updatedText = text.replacingCharacters(in: textRange, with: string)
//            print(updatedText)
//        }
//        return true
//    }
}
