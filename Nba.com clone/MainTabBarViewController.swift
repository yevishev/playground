//Класс нижнего тапбара

import UIKit

class MainTabBarViewController: UITabBarController {
    
    //метод, который вызывает после того, как иерархия view controller загрузилась в память. обычно этот метод переопределяется для выполнения дополнительной инициализации представления
    override func viewDidLoad() {
        super.viewDidLoad()
        //переопределить цвет фона
        view.backgroundColor = .systemYellow
        
        //в константе vc1 хранится объект класса viewController, который будет отвечать за представление в том случае, если он будет выбран на tabBar панели
        let vc1 = UINavigationController(rootViewController: NewsViewController())
        let vc2 = UINavigationController(rootViewController: ScoreboardViewController())
        let vc3 = UINavigationController(rootViewController: RankingsViewController())
        let vc4 = UINavigationController(rootViewController: ScheduleViewController())
        
        //установить изображения для кнопок взаимодействия
        vc1.tabBarItem.image = UIImage(systemName: "newspaper")
        vc2.tabBarItem.image = UIImage(systemName: "list.number")
        vc3.tabBarItem.image = UIImage(systemName: "chart.bar")
        vc4.tabBarItem.image = UIImage(systemName: "calendar")
        
        //уставновить текст под кнопками
        vc1.title = "News"
        vc2.title = "Scoreboard"
        vc3.title = "Rankings"
        vc4.title = "Schedule"
        
        //цвет тона. параметр tintColor применяет цвет для объектов tabBar панели
        tabBar.tintColor = .label
        //Первым параметром метода я устанавливаю массив объектов классов ViewController для tabBarController
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

