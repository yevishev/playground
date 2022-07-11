//
//  RankingsViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class RankingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        //button settings
        let button = UIButton(frame: CGRect(x: 160, y: 500, width: 100, height: 50))
        button.backgroundColor = .purple
        button.setTitle("check", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: UIControl.Event.touchUpInside)
        
        //slider settings
        let slider = UISlider(frame: CGRect(x: 20, y: 400, width: 380, height: 20))
        slider.minimumValueImage = UIImage(systemName: "tortoise")
        slider.maximumValueImage = UIImage(systemName: "hare")
        slider.minimumValue = 0.0;
        slider.maximumValue = 50.0;
        slider.addTarget(self, action: #selector(sliderValue), for: UIControl.Event.valueChanged)
        view.addSubview(button)
        view.addSubview(slider)
    }
    
    @objc func sliderValue(slider: UISlider) -> Float {
        print(slider.value)
        return slider.value
    }
    
    @objc func showAlert() {
      let alert = UIAlertController(
        title: "Hello, World",
        message: "This is my first app!",
        preferredStyle: .alert)
      let action = UIAlertAction(
        title: "Awesome",
        style: .default,
        handler: nil)
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
    }

}
