//
//  NewsViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    var newsImages: Array<String> = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image7",
    ]
    
    //записываю в константу замыкание для последующего вызова внутри данного класса, которая должна вернуть объект класса UITableView
    private let newsTableView: UITableView = {
        let table = UITableView()
        //в методе register указывается класс, который будет отвечать за логику создания ячейки таблицы
        table.register(NewsViewCell.self, forCellReuseIdentifier: "ImageViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        //как я понял, данный метод добавляет view поверх представления, которое до этого было в самом верху (т.е. superview). В данном случае поверх view с цветом systemBackground накладывается созданная таблица
        view.addSubview(newsTableView)
        
        //idk
        newsTableView.delegate = self
        //протокол, который выступает в качестве источника данных для заполнения таблицы. данные для таблицы не сохраняются
        newsTableView.dataSource = self
    }
    
    //как я понял, данный метод вызывается в том случае, чтобы необходимо было ViewControllerClass сообщить о том, что появляются ещё view, которые необходимо отрисовать
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // свойство frame в каком месте будет располагаться вьюшка, от которого была вызвана. В данном случае, newsTableView возвращает объект класса таблицы, и в свойство frame указывается, что она будет располагаться в границах собственной системы координат (как я понял в границах всего экрана)
        newsTableView.frame = view.bounds
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let someImage = UIImage(named: newsImages[indexPath.row])
        cell.backgroundView = UIImageView(image: someImage)
        cell.backgroundView?.contentMode = .redraw
        content.text = "news title"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
