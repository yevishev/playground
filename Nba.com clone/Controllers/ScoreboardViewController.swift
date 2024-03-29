//
//  ScoreboardViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class ScoreboardViewController: UIViewController {
    
    //записываю в константу замыкание для последующего вызова внутри данного класса, которая должна вернуть объект класса UITableView
    private let scoreboardTableView: UITableView = {
        let table = UITableView()
        //в методе register указывается класс, который будет отвечать за логику создания ячейки таблицы
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        //как я понял, данный метод добавляет view поверх представления, которое до этого было в самом верху (т.е. superview). В данном случае поверх view с цветом systemBackground накладывается созданная таблица
        view.addSubview(scoreboardTableView)
        
        //idk
        scoreboardTableView.delegate = self
        //протокол, который выступает в качестве источника данных для заполнения таблицы. данные для таблицы не сохраняются
        scoreboardTableView.dataSource = self
    }
    
    //как я понял, данный метод вызывается в том случае, чтобы необходимо было ViewControllerClass сообщить о том, что появляются ещё дочерний view, которые необходимо отрисовать
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // свойство frame в каком месте будет располагаться вьюшка, от которого была вызвана. В данном случае, newsTableView возвращает объект класса таблицы, и в свойство frame указывается, что она будет располагаться в границах собственной системы координат (как я понял в границах всего экрана)
        scoreboardTableView.frame = view.bounds
    }
}

extension ScoreboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "#2 Phoenix suns 2 2"
        return cell
    }
}

