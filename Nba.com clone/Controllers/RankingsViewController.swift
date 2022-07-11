//
//  RankingsViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class RankingsViewController: UIViewController {
    var sliderVal: Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        //slider settings
        let slider = UISlider(frame: CGRect(x: 20, y: 400, width: 380, height: 20))
        slider.minimumValueImage = UIImage(systemName: "tortoise")
        slider.maximumValueImage = UIImage(systemName: "hare")
        slider.minimumValue = 0.0;
        slider.maximumValue = 50.0;
        slider.addTarget(self, action: #selector(sliderValue), for: UIControl.Event.valueChanged)
        
        //button settings
        let button = UIButton(frame: CGRect(x: 160, y: 500, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("check", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: UIControl.Event.touchUpInside)
        
        let alert = UIAlertController(
            title: "Some instruction",
            message: """
            1. do something
            2. do more
            3. do better
        """,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Awesome",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        view.addSubview(button)
        view.addSubview(slider)
    }
    
    @objc func sliderValue(slider: UISlider) -> Float {
        sliderVal = slider.value
        return sliderVal
    }
    
    @objc func showAlert(_ sender: UIButton) {
        let currentValue: String = String(sliderVal)
        print(currentValue)
        let alert = UIAlertController(
            title: "Slider value is:",
            message: currentValue + " points",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Done",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
