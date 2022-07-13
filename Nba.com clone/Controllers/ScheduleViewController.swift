//
//  ScheduleViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class ScheduleViewController: UIViewController, UITextFieldDelegate {
    
    private let searchTextField = UITextField(frame: CGRect(x: 10, y: 100, width: 394, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.backgroundColor = .white
        searchTextField.borderStyle = .roundedRect
        searchTextField.clearButtonMode = .always
        searchTextField.returnKeyType = .search
        searchTextField.keyboardType = .default
        searchTextField.placeholder = "Maximum characters 20"
        searchTextField.delegate = self
        view.backgroundColor = .systemBackground
        view.addSubview(searchTextField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: string) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            print(updatedText)
        }
        return true
    }
}
