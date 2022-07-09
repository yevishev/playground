//Класс нижнего тапбара

import UIKit

class MainTabBarViewController: UITabBarController {
    
    //метод, который вызывает после того, как иерархия view controller загрузилась в память. обычно этот метод переопределяется для выполнения дополнительной инициализации представления
    override func viewDidLoad() {
        super.viewDidLoad()
        //переопределить цвет фона
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: NewsViewController())
        let vc2 = UINavigationController(rootViewController: ScoreboardViewController())
        let vc3 = UINavigationController(rootViewController: RankingsViewController())
        let vc4 = UINavigationController(rootViewController: ScheduleViewController())
    }


}

