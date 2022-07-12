//
//  RankingsViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class RankingsViewController: UIViewController {
    
    private var sliderValue: Float = 0.0 //значение слайдера
    private var scoreData: [Int] = [] // сюда аппендить очки после раунда
    private var randomValue: Int = Int.random(in: 1...100) //здесь генерить вначале и после завершения раунда новое значение
    private var scoreValue: Int = 0 //текущее значение
    private let randomValueLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 400, height: 50))
    private let roundsLabel = UILabel(frame: CGRect(x: 170, y: 600, width: 200, height: 50))
    private let scoreboardLabel = UILabel(frame: CGRect(x: 178, y: 650, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.randomValueLabel.text = setTextRandomValueLabel()
        self.roundsLabel.text = setTextRoundsLabel()
        self.scoreboardLabel.text = setTextScoreboardLabel()
        
        //slider settings
        let slider = UISlider(frame: CGRect(x: 20, y: 400, width: 380, height: 20))
        slider.minimumValueImage = UIImage(systemName: "tortoise")
        slider.maximumValueImage = UIImage(systemName: "hare")
        slider.minimumValue = 0.0;
        slider.maximumValue = 100.0;
        slider.addTarget(self, action: #selector(setSliderValue), for: UIControl.Event.valueChanged)//при изменении слайдера в свойство sliverVal записывается его значение
        
        //button settings
        let button = UIButton(frame: CGRect(x: 160, y: 500, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("check", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: UIControl.Event.touchUpInside)//при нажатии на кнопку производится подсчёт очков
        
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        view.addSubview(slider)
        view.addSubview(self.randomValueLabel)
        view.addSubview(self.roundsLabel)
        view.addSubview(self.scoreboardLabel)
    }
    
    func setTextRoundsLabel() -> String {
        return "Rounds: \(scoreData.count)"
    }
    
    func setTextScoreboardLabel() -> String {
        return "Score: \(self.scoreValue)"
    }
    
    func setTextRandomValueLabel() -> String {
        return "Put the Bull`s eye as close as u can: \(self.randomValue)"
    }
    
    @objc func setSliderValue(slider: UISlider) {
        self.sliderValue = slider.value
    }
    
    @objc func showAlert(_ sender: UIButton) {
        let roundScore: Int = 100 - abs(Int(self.sliderValue) - randomValue)
        self.scoreData.append(roundScore)
        let alert = UIAlertController(
            title: """
                Your value is: \(Int(self.sliderValue))
                Score value is: \(self.randomValue)
            """,
            message: "You achive: \(roundScore)",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Next round",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        var sum: Int = 0
        for item in self.scoreData {
            sum += item
        }
        self.scoreValue = sum
        self.randomValue = Int.random(in: 1...100)
        self.randomValueLabel.text = setTextRandomValueLabel()
        self.roundsLabel.text = setTextRoundsLabel()
        self.scoreboardLabel.text = setTextScoreboardLabel()
    }
}
